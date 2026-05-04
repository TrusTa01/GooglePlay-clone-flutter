// ignore_for_file: avoid_print
// Утилита синхронизации медиа-ссылок из Supabase Storage
//
// Запуск: dart run tools/generators/sync_storage_media_lists.dart
//
// Что делает:
//   1. Подключается к Supabase Storage через .env (SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)
//   2. Перебирает бакеты и папки:
//        products/icons/games_icons
//        products/icons/apps_icons
//        products/icons/books_covers
//        products/screenshots/games_screenshots
//        products/screenshots/apps_screenshots
//        banners/images
//   3. Строит публичные URL для каждого файла
//   4. Перезаписывает секции const List<String> в файлах:
//        tools/generators/products/games/games_text_data.dart  — icons, verticalScreenshots, horizontalScreenshots
//        tools/generators/products/apps/apps_text_data.dart    — icons, screenshots
//        tools/generators/products/books/books_text_data.dart  — icons
//        tools/generators/banners/banners_text_data.dart        — bannerImages

import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

// ──────────────────────────────────────────────────────────────────────────────
// Конфигурация бакетов
// ──────────────────────────────────────────────────────────────────────────────

const String _bucketProducts = 'products';
const String _bucketBanners = 'banners';

const String _folderGamesIcons = 'icons/games_icons';
const String _folderAppsIcons = 'icons/apps_icons';
const String _folderBooksCovers = 'icons/books_covers';
const String _folderGamesScreenshots = 'screenshots/games_screenshots';
const String _folderAppsScreenshots = 'screenshots/apps_screenshots';
const String _folderBannerImages = 'images';

// ──────────────────────────────────────────────────────────────────────────────
// Пути к файлам text_data
// ──────────────────────────────────────────────────────────────────────────────

const String _gamesTextDataPath =
    'tools/generators/products/games/games_text_data.dart';
const String _appsTextDataPath =
    'tools/generators/products/apps/apps_text_data.dart';
const String _booksTextDataPath =
    'tools/generators/products/books/books_text_data.dart';
const String _bannersTextDataPath =
    'tools/generators/banners/banners_text_data.dart';

// ──────────────────────────────────────────────────────────────────────────────
// Точка входа
// ──────────────────────────────────────────────────────────────────────────────

Future<void> main() async {
  final startedAt = DateTime.now();

  final env = DotEnv(includePlatformEnvironment: true)..load();
  final supabaseUrl = env['SUPABASE_URL'];
  final supabaseKey = env['SUPABASE_SERVICE_ROLE_KEY'];

  if (supabaseUrl == null || supabaseKey == null) {
    print('ERROR: Не заданы SUPABASE_URL или SUPABASE_SERVICE_ROLE_KEY в .env');
    exit(1);
  }

  final syncer = _StorageSyncer(supabaseUrl, supabaseKey);
  final result = await syncer.run();

  final elapsed = DateTime.now().difference(startedAt);
  if (result.totalUrls > 0 && result.errorCount == 0) {
    print('\nГотово! Время: ${elapsed.inMilliseconds} мс');
    print(
      'Теперь можно запустить генерацию данных:\n  dart run tools/generate_data.dart',
    );
    return;
  }

  if (result.totalUrls > 0) {
    print(
      '\nСинхронизация завершена с предупреждениями '
      '(ошибок: ${result.errorCount}). Время: ${elapsed.inMilliseconds} мс',
    );
    print('Проверьте ошибки выше, затем при необходимости запустите снова.');
    return;
  }

  print(
    '\nСинхронизация не загрузила ни одного файла. '
    'Проверьте SUPABASE_URL, ключ и пути к папкам в бакетах.',
  );
  print('Генерацию запускать пока рано.');
}

// ──────────────────────────────────────────────────────────────────────────────
// Синкер
// ──────────────────────────────────────────────────────────────────────────────

class _StorageSyncer {
  final String _supabaseKey;
  final String _base;
  int _errorCount = 0;

  _StorageSyncer(String supabaseUrl, this._supabaseKey)
    : _base = supabaseUrl.endsWith('/')
          ? supabaseUrl.substring(0, supabaseUrl.length - 1)
          : supabaseUrl;

  Future<_SyncRunResult> run() async {
    print('Загружаю список файлов из Supabase Storage...\n');

    final gamesIconUrls = await _listPublicUrls(
      _bucketProducts,
      _folderGamesIcons,
    );
    final appsIconUrls = await _listPublicUrls(
      _bucketProducts,
      _folderAppsIcons,
    );
    final booksIconUrls = await _listPublicUrls(
      _bucketProducts,
      _folderBooksCovers,
    );
    final gamesScreenshotUrls = await _listPublicUrls(
      _bucketProducts,
      _folderGamesScreenshots,
    );
    final appsScreenshotUrls = await _listPublicUrls(
      _bucketProducts,
      _folderAppsScreenshots,
    );
    final bannerImageUrls = await _listPublicUrls(
      _bucketBanners,
      _folderBannerImages,
    );

    _printSummary({
      'games icons': gamesIconUrls,
      'apps icons': appsIconUrls,
      'books covers': booksIconUrls,
      'games screenshots': gamesScreenshotUrls,
      'apps screenshots': appsScreenshotUrls,
      'banner images': bannerImageUrls,
    });

    final totalUrls =
        gamesIconUrls.length +
        appsIconUrls.length +
        booksIconUrls.length +
        gamesScreenshotUrls.length +
        appsScreenshotUrls.length +
        bannerImageUrls.length;

    if (totalUrls == 0) {
      print('\nПропускаю обновление файлов: список URL пуст.');
      return _SyncRunResult(totalUrls: 0, errorCount: _errorCount);
    }

    final gamesVerticalUrls = gamesScreenshotUrls
        .where((u) => u.contains('_vert'))
        .toList();
    final gamesHorizontalUrls = gamesScreenshotUrls
        .where((u) => u.contains('_horiz'))
        .toList();

    print('\nОбновляю games_text_data.dart...');
    await _updateFile(_gamesTextDataPath, {
      'icons': gamesIconUrls,
      'verticalScreenshots': gamesVerticalUrls,
      'horizontalScreenshots': gamesHorizontalUrls,
    });

    print('Обновляю apps_text_data.dart...');
    await _updateFile(_appsTextDataPath, {
      'icons': appsIconUrls,
      'screenshots': appsScreenshotUrls,
    });

    print('Обновляю books_text_data.dart...');
    await _updateFile(_booksTextDataPath, {'icons': booksIconUrls});

    print('Обновляю banners_text_data.dart...');
    await _updateFile(_bannersTextDataPath, {'bannerImages': bannerImageUrls});

    return _SyncRunResult(totalUrls: totalUrls, errorCount: _errorCount);
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Получение URL из бакета
  // ────────────────────────────────────────────────────────────────────────────

  /// Листинг файлов через Supabase Storage REST API:
  /// POST {supabaseUrl}/storage/v1/object/list/{bucket}
  /// body: { "prefix": folder, "limit": 1000, "offset": 0 }
  Future<List<String>> _listPublicUrls(String bucket, String folder) async {
    final uri = Uri.parse('$_base/storage/v1/object/list/$bucket');

    try {
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $_supabaseKey',
          'apikey': _supabaseKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prefix': folder,
          'limit': 1000,
          'offset': 0,
          'sortBy': {'column': 'name', 'order': 'asc'},
        }),
      );

      if (response.statusCode != 200) {
        _errorCount++;
        print(
          '  ERROR: $bucket/$folder → HTTP ${response.statusCode}: ${response.body}',
        );
        return [];
      }

      final List<dynamic> items = jsonDecode(response.body) as List<dynamic>;

      if (items.isEmpty) {
        print('  WARN: Папка $bucket/$folder пуста или не существует');
        return [];
      }

      return items
          .whereType<Map<String, dynamic>>()
          .where((f) {
            final name = f['name'] as String? ?? '';
            // Пропускаем "папки" (у них нет metadata или id равен null)
            return name.isNotEmpty && !name.startsWith('.') && f['id'] != null;
          })
          .map((f) => _buildPublicUrl(bucket, '$folder/${f['name']}'))
          .toList();
    } catch (e) {
      _errorCount++;
      print('  ERROR: Не удалось получить файлы из $bucket/$folder: $e');
      return [];
    }
  }

  String _buildPublicUrl(String bucket, String path) =>
      '$_base/storage/v1/object/public/$bucket/$path';

  // ────────────────────────────────────────────────────────────────────────────
  // Обновление секций const List<String> в файле
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _updateFile(
    String filePath,
    Map<String, List<String>> sections,
  ) async {
    final file = File(filePath);
    var content = await file.readAsString();

    for (final entry in sections.entries) {
      content = _replaceListSection(content, entry.key, entry.value);
    }

    await file.writeAsString(content);
    print('  ✓ $filePath');
  }

  String _replaceListSection(
    String content,
    String listName,
    List<String> urls,
  ) {
    final pattern = RegExp(
      r'(const List<String> ' +
          RegExp.escape(listName) +
          r'\s*=\s*\[)[^\]]*(\];)',
      dotAll: true,
    );

    if (!pattern.hasMatch(content)) {
      print('  WARN: Секция "$listName" не найдена в файле, пропускаю');
      return content;
    }

    final body = urls.isEmpty
        ? ''
        : '\n${urls.map((u) => "  '$u',").join('\n')}\n';

    return content.replaceFirstMapped(pattern, (m) => '${m[1]}$body${m[2]}');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Вывод статистики
  // ────────────────────────────────────────────────────────────────────────────

  void _printSummary(Map<String, List<String>> results) {
    print('Найдено файлов:');
    for (final entry in results.entries) {
      final status = entry.value.isEmpty ? '⚠ 0' : '✓ ${entry.value.length}';
      print('  ${entry.key.padRight(25)} $status');
    }
  }
}

class _SyncRunResult {
  final int totalUrls;
  final int errorCount;

  const _SyncRunResult({required this.totalUrls, required this.errorCount});
}
