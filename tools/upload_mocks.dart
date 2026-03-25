import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';

void main() async {
  // Инициализация клиента
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final supabaseUrl = env['SUPABASE_URL'];
  final serviceKey = env['SUPABASE_SERVICE_ROLE_KEY'];

  if (supabaseUrl == null || serviceKey == null) {
    log('Ошибка: SUPABASE_URL или SERVICE_ROLE_KEY не найдены в .env');
    return;
  }

  final supabase = SupabaseClient(supabaseUrl, serviceKey);

  log('Начинаем процесс наполнения базы данных...');

  try {
    // Загружаем по очереди все типы контента
    await processFile(supabase, 'assets/data/games.json', 'game');
    await processFile(supabase, 'assets/data/apps.json', 'app');
    await processBooks(
      supabase,
      'assets/data/books.json'
      'book',
    );

    log('Все данные успешно загружены!');
  } catch (e) {
    log('Ошибка при загрузке: $e');
  }
}

// Универсальная функция для приложений и игр
Future<void> processFile(
  SupabaseClient client,
  String path,
  String type,
) async {
  final file = File(path);
  if (!await file.exists()) return;

  // Читаем JSON и превращаем в List
  final List<dynamic> rawData = jsonDecode(await file.readAsString());
  log('Обработка $type: ${rawData.length} объектов...');

  // Разбиваем на пачки по 500 штук (Batching)
  // Это нужно, чтобы не отправить слишком тяжелый запрос за один раз
  for (var i = 0; i < rawData.length; i += 500) {
    final chunk = rawData.sublist(
      i,
      i + 500 > rawData.length ? rawData.length : i + 500,
    );

    // Шаг 1. Подготовка данных для основной таблицы products
    final productsToInsert = chunk
        .map(
          (item) => {
            'id': item['id'],
            'type': type,
            'title': item['title'],
            'creator': item['creator'],
            'creator_description': item['creatorDescription'],
            'rating': item['rating'],
            'reviews_count': item['reviewsCount'],
            'download_count': item['downloadCount'],
            'icon_url': item['iconUrl'],
            'is_paid': item['isPaid'],
            'price': item['price'],
            'currency_code': item['currencyCode'],
            'discount_price': item['discountPrice'],
            'contains_ads': item['containsAds'],
            'contains_paid_content': item['containsPaidContent'],
            'short_description': item['shortDescription'],
            'description': item['description'],
            'release_date': item['releaseDate'],
            'last_updated': item['lastUpdated'],
            'version': item['version'],
            'size_mb': item['size'],
            'package_name': item['packageName'],
            'url': item['url'],
            'website_url': item['websiteUrl'],
            'email_support': item['emailSupport'],
            'privacy_policy_url': item['privacyPolicyUrl'],
            'whats_new_text': item['whatsNewText'],
            'event_text': item['eventText'],
            'age_rating': item['ageRating'],
            'is_kids_friendly': item['isKidsFriendly'],
            'is_editor_choice': item['isEditorChoice'],

            // Специфичные поля для игр
            'is_online': item['isOnline'],
            'has_multiplayer': item['hasMultiplayer'],
            'has_achievements': item['hasAchievements'],
            'game_modes': item['gameModes'],
            'has_controller_support': item['hasControllerSupport'],

            // Информация о разработчике
            'developer_company': item['developerCompany'],
            'developer_address': item['developerAddress'],
            'developer_city': item['developerCity'],
            'developer_country': item['developerCountry'],
            'developer_phone': item['developerPhone'],
          },
        )
        .toList();

    // Записываем в таблицу products
    // .upsert() обновит данные, если ID уже существует (защита от дублей)
    await client.from('products').upsert(productsToInsert);

    // Шаг 2. Подготовка связанных данных
    final List<Map<String, dynamic>> tags = [];
    final List<Map<String, dynamic>> screenshots = [];
    final List<Map<String, dynamic>> categories = [];
    final List<Map<String, dynamic>> permissions = [];
    final List<Map<String, dynamic>> languages = [];
    final List<Map<String, dynamic>> ageReasons = [];

    for (var item in chunk) {
      if (item['tags'] != null) {
        for (var tag in item['tags']) {
          tags.add({'product_id': item['id'], 'tag_name': tag});
        }
      }
      if (item['screenshots'] != null) {
        for (var url in item['screenshots']) {
          screenshots.add({'product_id': item['id'], 'image_url': url});
        }
      }

      final dynamic rawCategories = item['appCategory'] ?? item['gameGenre'];
      if (rawCategories is List) {
        for (final category in rawCategories) {
          categories.add({'product_id': item['id'], 'category_name': category});
        }
      }

      if (item['permissions'] != null) {
        for (final permission in item['permissions']) {
          permissions.add({
            'product_id': item['id'],
            'permission_name': permission,
          });
        }
      }

      if (item['supportedLanguages'] != null) {
        for (final language in item['supportedLanguages']) {
          languages.add({'product_id': item['id'], 'language_code': language});
        }
      }

      if (item['ageRatingReasons'] != null) {
        for (final reason in item['ageRatingReasons']) {
          ageReasons.add({'product_id': item['id'], 'reason': reason});
        }
      }
    }

    // Записываем теги и скриншоты пачкой
    if (tags.isNotEmpty) await client.from('product_tags').upsert(tags);
    if (screenshots.isNotEmpty) {
      await client.from('product_screenshots').upsert(screenshots);
    }

    if (categories.isNotEmpty) {
      await client.from('product_categories').upsert(categories);
    }
    if (permissions.isNotEmpty) {
      await client.from('product_permissions').upsert(permissions);
    }
    if (languages.isNotEmpty) {
      await client.from('product_languages').upsert(languages);
    }
    if (ageReasons.isNotEmpty) {
      await client.from('product_age_reasons').upsert(ageReasons);
    }

    log('Загружено ${i + chunk.length} из ${rawData.length}');
  }
}

/// Отдельная функция для книг, так как структура полей отличается
Future<void> processBooks(SupabaseClient client, String path) async {
  final file = File(path);
  if (!await file.exists()) return;

  final List<dynamic> rawData = jsonDecode(await file.readAsString());
  log('Обработка book: ${rawData.length} объектов...');

  for (var i = 0; i < rawData.length; i += 500) {
    final chunk = rawData.sublist(
      i,
      i + 500 > rawData.length ? rawData.length : i + 500,
    );

    final booksToInsert = chunk
        .map(
          (item) => {
            'id': item['id'],
            'type': item['type'],
            'url': item['url'],
            'title': item['title'],
            'creator': item['creator'],
            'creator_description': item['creatorDescription'],
            'rating': item['rating'],
            'reviews_count': item['reviewsCount'],
            'icon_url': item['iconUrl'],
            'is_paid': item['isPaid'],
            'price': item['price'],
            'currency_code': item['currencyCode'],
            'discount_price': item['discountPrice'],
            'short_description': item['shortDescription'],
            'description': item['description'],
            'release_date': item['releaseDate'],
            'publication_date': item['publicationDate'],
            'publisher': item['publisher'],
            'page_count': item['pageCount'],
            'language': item['language'],
            'format': item['format'],
            'has_audio_version': item['hasAudioVersion'],
            'audio_duration': item['audioDuration']?.toString(),
            'narrator': item['narrator'],
            'is_series': item['isSeries'],
            'series_name': item['seriesName'],
            'series_number': item['seriesNumber'],
            'sample_available': item['sampleAvailable'],
            'is_abridged': item['isAbridged'],
          },
        )
        .toList();

    await client.from('books').upsert(booksToInsert);

    final List<Map<String, dynamic>> tags = [];
    final List<Map<String, dynamic>> categories = [];
    final List<Map<String, dynamic>> awards = [];

    for (var item in chunk) {
      if (item['tags'] != null) {
        for (final tag in item['tags']) {
          tags.add({'book_id': item['id'], 'tag_name': tag});
        }
      }

      if (item['categories'] != null) {
        for (final category in item['categories']) {
          categories.add({'book_id': item['id'], 'category_name': category});
        }
      }

      if (item['awards'] != null) {
        for (final award in item['awards']) {
          awards.add({'book_id': item['id'], 'award_name': award});
        }
      }
    }

    if (tags.isNotEmpty) await client.from('book_tags').upsert(tags);
    if (categories.isNotEmpty) {
      await client.from('book_categories').upsert(categories);
    }
    if (awards.isNotEmpty) await client.from('book_awards').upsert(awards);

    log('Загружено ${i + chunk.length} из ${rawData.length}');
  }
}
