// ignore_for_file: avoid_print
// Загрузка мок-данных в Supabase
//
// Запуск: dart run tools/upload_data.dart
//
// Требования:
//   - Сгенерированные файлы assets/data/games.json, apps.json, books.json
//   - Файл .env в корне проекта с SUPABASE_URL и SUPABASE_SERVICE_ROLE_KEY

import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

// ──────────────────────────────────────────────────────────────────────────────
// Конфигурация
// ──────────────────────────────────────────────────────────────────────────────

const int _batchSize = 500;
const _uuid = Uuid();

// ──────────────────────────────────────────────────────────────────────────────
// Точка входа
// ──────────────────────────────────────────────────────────────────────────────

Future<void> main() async {
  final env = DotEnv(includePlatformEnvironment: true)..load();

  final supabaseUrl = env['SUPABASE_URL'];
  final supabaseKey = env['SUPABASE_SERVICE_ROLE_KEY'];

  if (supabaseUrl == null || supabaseKey == null) {
    print('ERROR: Не заданы SUPABASE_URL или SUPABASE_SERVICE_ROLE_KEY в .env');
    exit(1);
  }

  final client = SupabaseClient(supabaseUrl, supabaseKey);

  try {
    final uploader = _DataUploader(client);
    await uploader.run();
    print('\nВсе данные успешно загружены!');
  } finally {
    client.dispose();
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Основной класс загрузки
// ──────────────────────────────────────────────────────────────────────────────

class _DataUploader {
  final SupabaseClient _client;

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
    // 1. Читаем JSON-файлы
    print('Читаю данные из JSON-файлов...');
    final games = await _readJson('assets/data/games.json');
    final apps = await _readJson('assets/data/apps.json');
    final books = await _readJson('assets/data/books.json');

    print(
      'Загружено: ${games.length} игр, ${apps.length} приложений, ${books.length} книг',
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
  // Вспомогательные методы
  // ────────────────────────────────────────────────────────────────────────────

  /// Вставка пачками без возврата данных
  Future<void> _batchUpsert(
    String table,
    List<Map<String, dynamic>> rows,
    String onConflict, {
    String? label,
  }) async {
    if (rows.isEmpty) return;
    final tag = label ?? table;
    final total = rows.length;
    int uploaded = 0;

    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, (i + _batchSize).clamp(0, rows.length));
      await _client.from(table).upsert(batch, onConflict: onConflict);
      uploaded += batch.length;
      print('[$tag] $uploaded/$total');
    }
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

    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, (i + _batchSize).clamp(0, rows.length));
      await _client.from(table).insert(batch);
      uploaded += batch.length;
      print('[$tag] inserted $uploaded/$total');
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
      if (val is String) return val;
    }
    if (field is String) return field;
    return '';
  }
}
