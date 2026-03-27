// ignore_for_file: avoid_print
// Загрузка мок-данных в Supabase
//
// Запуск: dart run tools/upload_data.dart
//
// Требования:
//   - Сгенерированные файлы assets/data/games.json, apps.json, books.json, banners.json
//   - Файл .env в корне проекта с SUPABASE_URL и SUPABASE_SERVICE_ROLE_KEY

import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

// ──────────────────────────────────────────────────────────────────────────────
// Конфигурация
// ──────────────────────────────────────────────────────────────────────────────

const String _contentSchema = 'content';
const int _batchSize = 500;
// Для delete через inFilter держим небольшой размер пачки,
// иначе URL фильтра может стать слишком длинным и дать 400 Bad Request
const int _cleanupBatchSize = 100;
const int _cleanupProgressEveryBatches = 20;
const _uuid = Uuid();

class _CleanupStats {
  final int batches;
  final int units;

  const _CleanupStats({required this.batches, required this.units});
}

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

  final client = SupabaseClient(supabaseUrl, supabaseKey);

  try {
    print(
      '\nWARNING: Перед загрузкой будут удалены все существующие данные в schema $_contentSchema',
    );
    while (true) {
      stdout.write('Вы точно хотите продолжить? (y/n): ');
      final confirm = stdin.readLineSync()?.trim().toLowerCase();
      if (confirm == 'y' || confirm == 'yes') {
        break;
      }
      if (confirm == 'n' || confirm == 'no') {
        print('Операция отменена пользователем');
        return;
      }
      print('Некорректный ввод. Введите y/yes или n/no');
    }
    final uploader = _DataUploader(client);
    await uploader.run();
    final elapsed = DateTime.now().difference(startedAt);
    final minutes = (elapsed.inMilliseconds / 60000).toStringAsFixed(2);
    _clearTerminalScreen();
    print('\nВсе данные успешно загружены!');
    print('Время выполнения: $minutes мин');
  } finally {
    client.dispose();
  }
}

void _clearTerminalScreen() {
  if (!stdout.hasTerminal) return;
  stdout.write('\x1B[2J\x1B[H');
}

// ──────────────────────────────────────────────────────────────────────────────
// Основной класс загрузки
// ──────────────────────────────────────────────────────────────────────────────

class _DataUploader {
  final SupabaseClient _client;
  final bool _canRewriteLine = stdout.hasTerminal;

  // Маппинги для дедупликации
  // developerKey (строка "company_en") → UUID в БД
  final Map<String, String> _developerIds = {};
  // categoryKey (строка "type:name_en") → integer id в БД
  final Map<String, int> _categoryIds = {};
  // tagKey (строка "type:name_en") → integer id в БД
  final Map<String, int> _tagIds = {};
  // external_id -> products.id (uuid) для безопасного повторного запуска
  final Map<String, String> _productIdsByExternalId = {};

  _DataUploader(this._client);

  Future<void> run() async {
    // 0. Перед загрузкой очищаем таблицы в schema content
    await _clearContentSchemaData();

    // 1. Читаем JSON-файлы
    print('Читаю данные из JSON-файлов...');
    final games = await _readJson('assets/data/games.json');
    final apps = await _readJson('assets/data/apps.json');
    final books = await _readJson('assets/data/books.json');
    final banners = await _readJson('assets/data/banners.json');

    print(
      'Загружено: ${games.length} игр, ${apps.length} приложений, ${books.length} книг, ${banners.length} баннеров',
    );

    // Предзагрузка существующих products для повторного запуска
    await _loadExistingProductsMap();

    // 2. Вставляем разработчиков (только для games и apps)
    await _uploadDevelopers([...games, ...apps]);

    // 3. Вставляем категории
    await _uploadCategories([...games, ...apps, ...books]);

    // 4. Вставляем теги
    await _uploadTags([...games, ...apps, ...books]);

    // 5. Вставляем игры
    await _uploadGames(games);

    // 6. Вставляем приложения
    await _uploadApps(apps);

    // 7. Вставляем книги
    await _uploadBooks(books);

    // 8. Вставляем баннеры
    await _uploadBanners(banners);
  }

  Future<void> _clearContentSchemaData() async {
    print('\n[cleanup] Очищаю таблицы в schema $_contentSchema...');

    final fastCleanup = await _tryFastCleanupViaRpc();
    if (fastCleanup) {
      print('[cleanup] Быстрая очистка через RPC выполнена');
      return;
    }

    const tablesInDeleteOrder = <String>[
      'product_tags',
      'product_categories',
      'banner_actions',
      'banner_events',
      'games',
      'apps',
      'books',
      'software_products',
      'products',
      'developers',
      'categories',
      'tags',
      'banners',
    ];

    for (final table in tablesInDeleteOrder) {
      final startedAt = DateTime.now();
      try {
        print('[cleanup] -> start $_contentSchema.$table');
        final stats = await _deleteAllRowsInContentTable(table);
        final elapsedMs = DateTime.now().difference(startedAt).inMilliseconds;
        print(
          '[cleanup] $_contentSchema.$table очищена (батчей: ${stats.batches}, единиц: ${stats.units}, ${elapsedMs}ms)',
        );
      } catch (e) {
        // Если таблицы нет в content, просто пропускаем.
        print('[cleanup] skip $_contentSchema.$table: $e');
      }
    }
  }

  Future<bool> _tryFastCleanupViaRpc() async {
    try {
      await _client.rpc('reset_content_data');
      return true;
    } catch (e) {
      print(
        '[cleanup] RPC reset_content_data недоступен, fallback на batch-delete: $e',
      );
      return false;
    }
  }

  Future<_CleanupStats> _deleteAllRowsInContentTable(String table) async {
    switch (table) {
      case 'categories':
      case 'tags':
        return _deleteByIdBatches<int>(table, 'id');
      case 'banner_actions':
      case 'banner_events':
        return _deleteByIdBatches<String>(table, 'banner_id');
      case 'product_tags':
      case 'product_categories':
        return _deleteByProductIdBatches(table);
      default:
        return _deleteByIdBatches<String>(table, 'id');
    }
  }

  Future<_CleanupStats> _deleteByIdBatches<T>(
    String table,
    String idColumn,
  ) async {
    int batches = 0;
    int units = 0;
    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from(table)
          .select(idColumn)
          .range(0, _cleanupBatchSize - 1);

      final ids = (response as List)
          .map((row) => (row as Map)[idColumn])
          .whereType<T>()
          .toSet()
          .toList();

      if (ids.isEmpty) {
        return _CleanupStats(batches: batches, units: units);
      }

      await _client
          .schema(_contentSchema)
          .from(table)
          .delete()
          .inFilter(idColumn, ids);
      batches += 1;
      units += ids.length;
      if (batches % _cleanupProgressEveryBatches == 0) {
        print(
          '[cleanup] $_contentSchema.$table в процессе... батчей: $batches, единиц: $units',
        );
      }
    }
  }

  Future<_CleanupStats> _deleteByProductIdBatches(String table) async {
    int batches = 0;
    int units = 0;
    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from(table)
          .select('product_id')
          .range(0, _cleanupBatchSize - 1);

      final productIds = (response as List)
          .map((row) => (row as Map)['product_id'])
          .whereType<String>()
          .toSet()
          .toList();

      if (productIds.isEmpty) {
        return _CleanupStats(batches: batches, units: units);
      }

      await _client
          .schema(_contentSchema)
          .from(table)
          .delete()
          .inFilter('product_id', productIds);
      batches += 1;
      units += productIds.length;
      if (batches % _cleanupProgressEveryBatches == 0) {
        print(
          '[cleanup] $_contentSchema.$table в процессе... батчей: $batches, product_id: $units',
        );
      }
    }
  }

  Future<void> _loadExistingProductsMap() async {
    final rows = await _selectAllRows('products', 'id,external_id');
    for (final row in rows) {
      final id = row['id'] as String?;
      final externalId = row['external_id'] as String?;
      if (id != null && externalId != null && externalId.isNotEmpty) {
        _productIdsByExternalId[externalId] = id;
      }
    }
    print('[products] Уже существует: ${_productIdsByExternalId.length}');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Разработчики
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadDevelopers(List<Map<String, dynamic>> items) async {
    print('\n[developers] Дедупликация...');

    // Дедуплицируем по company->en
    final Map<String, Map<String, dynamic>> unique = {};
    for (final item in items) {
      final company = item['developerCompany'];
      if (company == null) continue;
      final key = _locValue(company, 'en');
      if (key.isEmpty) continue;
      unique.putIfAbsent(
        key,
        () => {
          'id': _uuid.v4(),
          'company': company,
          'address': item['developerAddress'] ?? {},
          'city': item['developerCity'] ?? {},
          'country': item['developerCountry'] ?? {},
          'phone': item['developerPhone'] ?? '',
          'website_url': item['websiteUrl'] ?? '',
          'email_support': item['emailSupport'] ?? '',
          'privacy_policy_url': item['privacyPolicyUrl'] ?? '',
        },
      );
      _developerIds[key] = unique[key]!['id'];
    }

    final rows = unique.values.toList();
    print('[developers] Уникальных: ${rows.length}');
    await _batchUpsert('developers', rows, 'id');
    print('[developers] Готово');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Категории
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadCategories(List<Map<String, dynamic>> items) async {
    print('\n[categories] Дедупликация...');

    // Собираем уникальные категории
    // Для игр: поле "gameGenre", тип "game"
    // Для приложений: поле "appCategory", тип "app"
    // Для книг: поле "genre", тип "book"

    final Map<String, Map<String, dynamic>> unique = {};

    void addCategories(List<dynamic>? cats, String type) {
      if (cats == null) return;
      for (final cat in cats.whereType<Map>()) {
        final nameEn = _locValue(cat, 'en');
        if (nameEn.isEmpty) continue;
        final key = '$type:$nameEn';
        unique.putIfAbsent(
          key,
          () => {'name': Map<String, dynamic>.from(cat), 'type': type},
        );
      }
    }

    for (final item in items) {
      final type = item['type'] as String?;
      if (type == 'game') {
        addCategories(item['gameGenre'] as List<dynamic>?, 'game');
      } else if (type == 'app') {
        addCategories(item['appCategory'] as List<dynamic>?, 'app');
      } else if (type == 'book') {
        addCategories(item['genre'] as List<dynamic>?, 'book');
      }
    }

    final rows = unique.values.toList();
    print('[categories] Уникальных: ${rows.length}');

    final existingRows = await _selectAllRows('categories', 'id,name,type');
    final existingKeys = <String>{};
    for (final row in existingRows) {
      final id = row['id'] as int?;
      final name = row['name'];
      final type = row['type'] as String?;
      if (id == null || name == null || type == null) continue;
      final nameEn = _locValue(name, 'en');
      if (nameEn.isEmpty) continue;
      final key = '$type:$nameEn';
      existingKeys.add(key);
      _categoryIds[key] = id;
    }

    final missingRows = rows.where((row) {
      final type = row['type'] as String?;
      final nameEn = _locValue(row['name'], 'en');
      if (type == null || nameEn.isEmpty) return false;
      return !existingKeys.contains('$type:$nameEn');
    }).toList();

    if (missingRows.isNotEmpty) {
      await _batchInsert('categories', missingRows, label: 'categories');
    }

    final finalRows = await _selectAllRows('categories', 'id,name,type');
    for (final row in finalRows) {
      final id = row['id'] as int?;
      final name = row['name'];
      final type = row['type'] as String?;
      if (id == null || name == null || type == null) continue;
      final nameEn = _locValue(name, 'en');
      if (nameEn.isNotEmpty) {
        _categoryIds['$type:$nameEn'] = id;
      }
    }

    print('[categories] Готово, загружено id: ${_categoryIds.length}');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Теги
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadTags(List<Map<String, dynamic>> items) async {
    print('\n[tags] Дедупликация...');

    final Map<String, Map<String, dynamic>> unique = {};

    for (final item in items) {
      final type = item['type'] as String?;
      final tags = item['tags'] as List<dynamic>?;
      if (tags == null || type == null) continue;

      for (final tag in tags.whereType<Map>()) {
        final nameEn = _locValue(tag, 'en');
        if (nameEn.isEmpty) continue;
        final key = '$type:$nameEn';
        unique.putIfAbsent(
          key,
          () => {'name': Map<String, dynamic>.from(tag), 'type': type},
        );
      }
    }

    final rows = unique.values.toList();
    print('[tags] Уникальных: ${rows.length}');

    final existingRows = await _selectAllRows('tags', 'id,name,type');
    final existingKeys = <String>{};
    for (final row in existingRows) {
      final id = row['id'] as int?;
      final name = row['name'];
      final type = row['type'] as String?;
      if (id == null || name == null || type == null) continue;
      final nameEn = _locValue(name, 'en');
      if (nameEn.isEmpty) continue;
      final key = '$type:$nameEn';
      existingKeys.add(key);
      _tagIds[key] = id;
    }

    final missingRows = rows.where((row) {
      final type = row['type'] as String?;
      final nameEn = _locValue(row['name'], 'en');
      if (type == null || nameEn.isEmpty) return false;
      return !existingKeys.contains('$type:$nameEn');
    }).toList();

    if (missingRows.isNotEmpty) {
      await _batchInsert('tags', missingRows, label: 'tags');
    }

    final finalRows = await _selectAllRows('tags', 'id,name,type');
    for (final row in finalRows) {
      final id = row['id'] as int?;
      final name = row['name'];
      final type = row['type'] as String?;
      if (id == null || name == null || type == null) continue;
      final nameEn = _locValue(name, 'en');
      if (nameEn.isNotEmpty) {
        _tagIds['$type:$nameEn'] = id;
      }
    }

    print('[tags] Готово, загружено id: ${_tagIds.length}');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Игры
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadGames(List<Map<String, dynamic>> games) async {
    print('\n[games] Начинаю загрузку ${games.length} игр...');

    final List<Map<String, dynamic>> productRows = [];
    final List<Map<String, dynamic>> softwareRows = [];
    final List<Map<String, dynamic>> gameRows = [];
    final List<Map<String, dynamic>> productCategoryRows = [];
    final List<Map<String, dynamic>> productTagRows = [];

    for (final g in games) {
      final externalId = g['id'] as String;
      final productId = _productIdsByExternalId[externalId] ?? _uuid.v4();
      _productIdsByExternalId[externalId] = productId;

      // products
      productRows.add({
        'id': productId,
        'external_id': externalId,
        'type': 'game',
        'title': g['title'],
        'creator': g['creator'],
        'creator_description': g['creatorDescription'],
        'short_description': g['shortDescription'],
        'description': g['description'],
        'rating': (g['rating'] as num).toDouble(),
        'reviews_count': g['reviewsCount'],
        'release_date': g['releaseDate'],
        'icon_url': g['iconUrl'] ?? '',
        'is_paid': g['isPaid'] ?? false,
        'price': g['price'],
        'currency_code': g['currencyCode'] ?? 'USD',
        'discount_price': g['discountPrice'],
        'url': g['url'] ?? '',
      });

      // software_products
      final companyKey = _locValue(g['developerCompany'], 'en');
      final developerId = _developerIds[companyKey];

      softwareRows.add({
        'id': productId,
        'developer_id': developerId,
        'screenshots': g['screenshots'] ?? [],
        'supported_languages': g['supportedLanguages'] ?? [],
        'contains_ads': g['containsAds'] ?? false,
        'contains_paid_content': g['containsPaidContent'] ?? false,
        'version': g['version'] ?? '1.0.0',
        'size': (g['size'] ?? '').toString(),
        'event_text': g['eventText'],
        'whats_new_text': g['whatsNewText'] ?? {},
        'download_count': g['downloadCount'] ?? 0,
        'age_rating': g['ageRating'] ?? 0,
        'is_kids_friendly': g['isKidsFriendly'] ?? false,
        'age_rating_reasons': g['ageRatingReasons'] ?? [],
        'permissions': g['permissions'] ?? [],
        'last_updated': g['lastUpdated'],
      });

      // games
      gameRows.add({
        'id': productId,
        'is_online': g['isOnline'],
        'has_multiplayer': g['hasMultiplayer'],
        'game_modes': g['gameModes'],
        'has_controller_support': g['hasControllerSupport'],
        'achievements': g['achievements'] ?? [],
      });

      // product_categories
      final genres = g['gameGenre'] as List<dynamic>? ?? [];
      for (final genre in genres.whereType<Map>()) {
        final nameEn = _locValue(genre, 'en');
        final catId = _categoryIds['game:$nameEn'];
        if (catId != null) {
          productCategoryRows.add({
            'product_id': productId,
            'category_id': catId,
          });
        }
      }

      // product_tags
      final tags = g['tags'] as List<dynamic>? ?? [];
      for (final tag in tags.whereType<Map>()) {
        final nameEn = _locValue(tag, 'en');
        final tagId = _tagIds['game:$nameEn'];
        if (tagId != null) {
          productTagRows.add({'product_id': productId, 'tag_id': tagId});
        }
      }
    }

    await _batchUpsert(
      'products',
      productRows,
      'external_id',
      label: 'games→products',
    );
    await _batchUpsert(
      'software_products',
      softwareRows,
      'id',
      label: 'games→software_products',
    );
    await _batchUpsert('games', gameRows, 'id', label: 'games→games');
    await _batchUpsert(
      'product_categories',
      productCategoryRows,
      'product_id,category_id',
      label: 'games→product_categories',
    );
    await _batchUpsert(
      'product_tags',
      productTagRows,
      'product_id,tag_id',
      label: 'games→product_tags',
    );

    print('[games] Готово');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Приложения
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadApps(List<Map<String, dynamic>> apps) async {
    print('\n[apps] Начинаю загрузку ${apps.length} приложений...');

    final List<Map<String, dynamic>> productRows = [];
    final List<Map<String, dynamic>> softwareRows = [];
    final List<Map<String, dynamic>> appRows = [];
    final List<Map<String, dynamic>> productCategoryRows = [];
    final List<Map<String, dynamic>> productTagRows = [];

    for (final a in apps) {
      final externalId = a['id'] as String;
      final productId = _productIdsByExternalId[externalId] ?? _uuid.v4();
      _productIdsByExternalId[externalId] = productId;

      // products
      productRows.add({
        'id': productId,
        'external_id': externalId,
        'type': 'app',
        'title': a['title'],
        'creator': a['creator'],
        'creator_description': a['creatorDescription'],
        'short_description': a['shortDescription'],
        'description': a['description'],
        'rating': (a['rating'] as num).toDouble(),
        'reviews_count': a['reviewsCount'],
        'release_date': a['releaseDate'],
        'icon_url': a['iconUrl'] ?? '',
        'is_paid': a['isPaid'] ?? false,
        'price': a['price'],
        'currency_code': a['currencyCode'] ?? 'USD',
        'discount_price': a['discountPrice'],
        'url': a['url'] ?? '',
      });

      // software_products
      final companyKey = _locValue(a['developerCompany'], 'en');
      final developerId = _developerIds[companyKey];

      softwareRows.add({
        'id': productId,
        'developer_id': developerId,
        'screenshots': a['screenshots'] ?? [],
        'supported_languages': a['supportedLanguages'] ?? [],
        'contains_ads': a['containsAds'] ?? false,
        'contains_paid_content': a['containsPaidContent'] ?? false,
        'version': a['version'] ?? '1.0.0',
        'size': (a['size'] ?? '').toString(),
        'event_text': a['eventText'],
        'whats_new_text': a['whatsNewText'] ?? {},
        'download_count': a['downloadCount'] ?? 0,
        'age_rating': a['ageRating'] ?? 0,
        'is_kids_friendly': a['isKidsFriendly'] ?? false,
        'age_rating_reasons': a['ageRatingReasons'] ?? [],
        'permissions': a['permissions'] ?? [],
        'last_updated': a['lastUpdated'],
      });

      // apps
      appRows.add({'id': productId, 'package_name': a['packageName'] ?? ''});

      // product_categories
      final cats = a['appCategory'] as List<dynamic>? ?? [];
      for (final cat in cats.whereType<Map>()) {
        final nameEn = _locValue(cat, 'en');
        final catId = _categoryIds['app:$nameEn'];
        if (catId != null) {
          productCategoryRows.add({
            'product_id': productId,
            'category_id': catId,
          });
        }
      }

      // product_tags
      final tags = a['tags'] as List<dynamic>? ?? [];
      for (final tag in tags.whereType<Map>()) {
        final nameEn = _locValue(tag, 'en');
        final tagId = _tagIds['app:$nameEn'];
        if (tagId != null) {
          productTagRows.add({'product_id': productId, 'tag_id': tagId});
        }
      }
    }

    await _batchUpsert(
      'products',
      productRows,
      'external_id',
      label: 'apps→products',
    );
    await _batchUpsert(
      'software_products',
      softwareRows,
      'id',
      label: 'apps→software_products',
    );
    await _batchUpsert('apps', appRows, 'id', label: 'apps→apps');
    await _batchUpsert(
      'product_categories',
      productCategoryRows,
      'product_id,category_id',
      label: 'apps→product_categories',
    );
    await _batchUpsert(
      'product_tags',
      productTagRows,
      'product_id,tag_id',
      label: 'apps→product_tags',
    );

    print('[apps] Готово');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Книги
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadBooks(List<Map<String, dynamic>> books) async {
    print('\n[books] Начинаю загрузку ${books.length} книг...');

    final List<Map<String, dynamic>> productRows = [];
    final List<Map<String, dynamic>> bookRows = [];
    final List<Map<String, dynamic>> productCategoryRows = [];
    final List<Map<String, dynamic>> productTagRows = [];

    for (final b in books) {
      final externalId = b['id'] as String;
      final productId = _productIdsByExternalId[externalId] ?? _uuid.v4();
      _productIdsByExternalId[externalId] = productId;

      // products
      productRows.add({
        'id': productId,
        'external_id': externalId,
        'type': 'book',
        'title': b['title'],
        'creator': b['creator'],
        'creator_description': b['creatorDescription'],
        'short_description': b['shortDescription'],
        'description': b['description'],
        'rating': (b['rating'] as num).toDouble(),
        'reviews_count': b['reviewsCount'],
        'release_date': b['releaseDate'],
        'icon_url': b['iconUrl'] ?? '',
        'is_paid': b['isPaid'] ?? false,
        'price': b['price'],
        'currency_code': b['currencyCode'] ?? 'USD',
        'discount_price': b['discountPrice'],
        'url': b['url'] ?? '',
      });

      // books
      bookRows.add({
        'id': productId,
        'publisher': b['publisher'] ?? {'en': '', 'ru': ''},
        'page_count': b['pageCount'] ?? 0,
        'language': b['language'] ?? '',
        'format': b['format'] ?? '',
        'has_audio_version': b['hasAudioVersion'] ?? false,
        'audio_duration': b['audioDuration'],
        'narrator': b['narrator'],
        'is_series': b['isSeries'] ?? false,
        'series_name': b['seriesName'],
        'series_number': b['seriesNumber'],
        'sample_available': b['sampleAvailable'] ?? false,
        'is_abridged': b['isAbridged'] ?? false,
        'publication_date': b['publicationDate'],
        'awards': b['awards'] ?? [],
      });

      // product_categories (жанры книг)
      final genres = b['genre'] as List<dynamic>? ?? [];
      for (final genre in genres.whereType<Map>()) {
        final nameEn = _locValue(genre, 'en');
        final catId = _categoryIds['book:$nameEn'];
        if (catId != null) {
          productCategoryRows.add({
            'product_id': productId,
            'category_id': catId,
          });
        }
      }

      // product_tags
      final tags = b['tags'] as List<dynamic>? ?? [];
      for (final tag in tags.whereType<Map>()) {
        final nameEn = _locValue(tag, 'en');
        final tagId = _tagIds['book:$nameEn'];
        if (tagId != null) {
          productTagRows.add({'product_id': productId, 'tag_id': tagId});
        }
      }
    }

    await _batchUpsert(
      'products',
      productRows,
      'external_id',
      label: 'books→products',
    );
    await _batchUpsert('books', bookRows, 'id', label: 'books→books');
    await _batchUpsert(
      'product_categories',
      productCategoryRows,
      'product_id,category_id',
      label: 'books→product_categories',
    );
    await _batchUpsert(
      'product_tags',
      productTagRows,
      'product_id,tag_id',
      label: 'books→product_tags',
    );

    print('[books] Готово');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Баннеры
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _uploadBanners(List<Map<String, dynamic>> banners) async {
    print('\n[banners] Начинаю загрузку ${banners.length} баннеров...');
    if (banners.isEmpty) {
      print('[banners] Нет данных, пропускаю');
      return;
    }

    final List<Map<String, dynamic>> bannerRows = [];
    final List<Map<String, dynamic>> bannerEventRows = [];
    final List<Map<String, dynamic>> bannerActionRows = [];

    for (final b in banners) {
      final sourceId = (b['id'] ?? '').toString();
      final type = _normalizeBannerType((b['type'] ?? '').toString());
      // ignore: deprecated_member_use
      final bannerId = _uuid.v5(Uuid.NAMESPACE_URL, 'banner:$sourceId');

      bannerRows.add({
        // Стабильный UUID на базе source-id для безопасного повторного запуска.
        'id': bannerId,
        'type': type,
        'image_asset_path': (b['imageAssetPath'] ?? '').toString(),
        'title': _asLocalizedMap(b['title']),
        'top_tooltip_text': _asNullableLocalizedMap(b['topToolTipText']),
        'description': _asLocalizedMap(b['description']),
      });

      if (type == 'event') {
        bannerEventRows.add({
          'banner_id': bannerId,
          'event_id': _asNullableString(b['eventId']),
          'event_category': _asNullableString(b['eventCategory']),
          'event_description': _asNullableLocalizedMap(b['eventDescription']),
        });
      } else if (type == 'action') {
        bannerActionRows.add({
          'banner_id': bannerId,
          // В моках productId соответствует products.external_id (например g_407).
          'product_external_id': _asNullableString(b['productId']),
        });
      }
    }

    await _batchUpsert(
      'banners',
      bannerRows,
      'id',
      label: 'banners',
      schema: 'content',
    );
    await _batchUpsert(
      'banner_events',
      bannerEventRows,
      'banner_id',
      label: 'banner_events',
      schema: 'content',
    );
    await _batchUpsert(
      'banner_actions',
      bannerActionRows,
      'banner_id',
      label: 'banner_actions',
      schema: 'content',
    );

    print('[banners] Готово');
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Вспомогательные методы
  // ────────────────────────────────────────────────────────────────────────────

  /// Вставка пачками без возврата данных
  Future<void> _batchUpsert(
    String table,
    List<Map<String, dynamic>> rows,
    String onConflict, {
    String? label,
    String? schema,
  }) async {
    if (rows.isEmpty) return;
    final tag = label ?? table;
    final total = rows.length;
    int uploaded = 0;
    int lastPrintedPercent = 0;
    if (!_canRewriteLine) {
      print(
        '[$tag] start upsert (update existing + insert new), total: $total',
      );
    }

    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, (i + _batchSize).clamp(0, rows.length));
      final query = _client.schema(schema ?? _contentSchema).from(table);
      await query.upsert(batch, onConflict: onConflict);
      uploaded += batch.length;
      final percent = ((uploaded * 100) / total).floor();
      if (uploaded == total || percent >= lastPrintedPercent + 10) {
        _printProgress(tag, '$uploaded/$total ($percent%)');
        lastPrintedPercent = percent;
      }
    }
    _finishProgressLine();
  }

  /// Вставка пачками без onConflict (для таблиц без уникального индекса)
  Future<void> _batchInsert(
    String table,
    List<Map<String, dynamic>> rows, {
    String? label,
  }) async {
    if (rows.isEmpty) return;
    final tag = label ?? table;
    final total = rows.length;
    int uploaded = 0;
    int lastPrintedPercent = 0;
    if (!_canRewriteLine) {
      print('[$tag] start insert, total: $total');
    }

    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, (i + _batchSize).clamp(0, rows.length));
      await _client.schema(_contentSchema).from(table).insert(batch);
      uploaded += batch.length;
      final percent = ((uploaded * 100) / total).floor();
      if (uploaded == total || percent >= lastPrintedPercent + 10) {
        _printProgress(tag, 'inserted $uploaded/$total ($percent%)');
        lastPrintedPercent = percent;
      }
    }
    _finishProgressLine();
  }

  void _printProgress(String tag, String text) {
    if (_canRewriteLine) {
      stdout.write('\r[$tag] $text');
      return;
    }
    print('[$tag] $text');
  }

  void _finishProgressLine() {
    if (_canRewriteLine) {
      stdout.write('\n');
    }
  }

  /// Вычитывает все строки таблицы порциями
  Future<List<Map<String, dynamic>>> _selectAllRows(
    String table,
    String columns,
  ) async {
    const pageSize = 1000;
    var from = 0;
    final rows = <Map<String, dynamic>>[];

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from(table)
          .select(columns)
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((r) => Map<String, dynamic>.from(r as Map))
          .toList();
      rows.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return rows;
  }

  /// Читает JSON-файл и возвращает список объектов
  Future<List<Map<String, dynamic>>> _readJson(String path) async {
    final file = File(path);
    if (!await file.exists()) {
      print('WARN: файл $path не найден, пропускаю');
      return [];
    }
    final content = await file.readAsString();
    final decoded = jsonDecode(content) as List<dynamic>;
    return decoded
        .whereType<Map>()
        .map((m) => Map<String, dynamic>.from(m))
        .toList();
  }

  /// Извлекает строковое значение из локализованного поля {"en": "...", "ru": "..."}
  String _locValue(dynamic field, String lang) {
    if (field is Map) {
      final val = field[lang];
      if (val is String && val.isNotEmpty) return val;
      for (final fallback in ['en', 'ru']) {
        final fallbackVal = field[fallback];
        if (fallbackVal is String && fallbackVal.isNotEmpty) {
          return fallbackVal;
        }
      }
    }
    if (field is String) return field;
    return '';
  }

  String? _asNullableString(dynamic value) {
    if (value == null) return null;
    final str = value.toString().trim();
    return str.isEmpty ? null : str;
  }

  Map<String, String> _asLocalizedMap(dynamic value) {
    if (value is Map) {
      final en = _asNullableString(value['en']) ?? '';
      final ru = _asNullableString(value['ru']) ?? '';
      return {'en': en, 'ru': ru};
    }
    final str = _asNullableString(value) ?? '';
    return {'en': str, 'ru': str};
  }

  Map<String, String>? _asNullableLocalizedMap(dynamic value) {
    if (value == null) return null;
    final map = _asLocalizedMap(value);
    final hasData = map.values.any((v) => v.trim().isNotEmpty);
    return hasData ? map : null;
  }

  String _normalizeBannerType(String value) {
    if (value == 'action') return 'action';
    return 'event';
  }
}
