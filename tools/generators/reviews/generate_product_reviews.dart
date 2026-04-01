// ignore_for_file: avoid_print
//
// Генератор отзывов в БД Supabase.
//
// Запуск:
//   dart run tools/generate_product_reviews.dart
//
// Требования:
//   - Файл .env в корне проекта с SUPABASE_URL и SUPABASE_SERVICE_ROLE_KEY
//
// Что делает:
//   1) Читает всех пользователей из public.profiles (id)
//   2) Читает все продукты из content.products (id)
//   3) Для каждого продукта выбирает реалистичный tier популярности
//      и генерирует отзывы по long-tail распределению
//   4) Следит за уникальностью пары (product_id, user_id)
//   5) Не трогает content.products.rating_avg/reviews_count (это делает триггер)

import 'dart:io';
import 'dart:math';

import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';
import 'reviews_text_data.dart';

const String _contentSchema = 'content';
const int _batchSize = 1000;
const double _developerReplyChance = 0.15;

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
  final generator = _ReviewsGenerator(client);

  try {
    await generator.run();
    final elapsed = DateTime.now().difference(startedAt);
    print(
      'Готово за ${(elapsed.inMilliseconds / 1000).toStringAsFixed(1)} сек',
    );
  } finally {
    client.dispose();
  }
}

class _ReviewsGenerator {
  _ReviewsGenerator(this._client);

  final SupabaseClient _client;
  final Random _random = Random();

  Future<void> run() async {
    final profileIds = await _loadProfileIds();
    final products = await _loadProducts();

    if (profileIds.isEmpty) {
      throw StateError('В public.profiles нет пользователей.');
    }
    if (products.isEmpty) {
      throw StateError('В content.products нет продуктов.');
    }

    print('Профилей: ${profileIds.length}');
    print('Продуктов: ${products.length}');

    final now = DateTime.now().toUtc();
    int totalInserted = 0;

    for (int index = 0; index < products.length; index++) {
      final product = products[index];
      final productId = product.id;
      final existingUserIds = await _loadExistingReviewUserIds(productId);

      final maxAllowed = profileIds.length - existingUserIds.length;
      if (maxAllowed <= 0) {
        _printProgress(index + 1, products.length, productId, 0, 0);
        continue;
      }

      final targetCount = _calculateTargetReviews(product);
      final toGenerate = min(targetCount, maxAllowed);

      final chosenUsers = _pickUniqueUsers(
        profileIds: profileIds,
        excludedUserIds: existingUserIds,
        count: toGenerate,
      );

      final rows = <Map<String, dynamic>>[];
      for (final userId in chosenUsers) {
        final createdAt = _randomDateWithinLastMonths(now, 12);
        final rating = _generateRating();
        final reply = _maybeGenerateDeveloperReply(product, createdAt);
        rows.add({
          'product_id': productId,
          'user_id': userId,
          'rating': rating,
          'content': _generateReviewText(rating),
          'developer_id': reply?.developerId,
          'developer_content': reply?.content,
          'responsed_at': reply?.responsedAt.toIso8601String(),
          'created_at': createdAt.toIso8601String(),
        });
      }

      await _batchInsertReviews(rows);
      totalInserted += rows.length;
      _printProgress(
        index + 1,
        products.length,
        productId,
        rows.length,
        totalInserted,
      );
    }

    print('Всего вставлено отзывов: $totalInserted');
    print('Поля rating_avg/reviews_count в products не обновлялись скриптом.');
  }

  Future<List<String>> _loadProfileIds() async {
    const pageSize = 1000;
    int from = 0;
    final ids = <String>[];

    while (true) {
      final response = await _client
          .from('profiles')
          .select('id')
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((row) => (row as Map)['id'])
          .whereType<String>()
          .toList();
      ids.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return ids;
  }

  Future<List<_ProductInfo>> _loadProducts() async {
    const pageSize = 1000;
    int from = 0;
    final products = <_ProductInfo>[];
    final softwareDeveloperIds = await _loadSoftwareDeveloperIds();

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from('products')
          .select('id,type,release_date')
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((row) {
            final data = Map<String, dynamic>.from(row as Map);
            final id = data['id'] as String?;
            final type = data['type'] as String?;
            final releaseDate = _parseDate(data['release_date']);
            if (id == null || type == null) return null;
            return _ProductInfo(
              id: id,
              type: type,
              releaseDate: releaseDate,
              softwareDeveloperId: softwareDeveloperIds[id],
            );
          })
          .whereType<_ProductInfo>()
          .toList();
      products.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return products;
  }

  Future<Map<String, String>> _loadSoftwareDeveloperIds() async {
    const pageSize = 1000;
    int from = 0;
    final map = <String, String>{};

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from('software_products')
          .select('id,developer_id')
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((row) => Map<String, dynamic>.from(row as Map))
          .toList();

      for (final item in batch) {
        final id = item['id'] as String?;
        final developerId = item['developer_id'] as String?;
        if (id != null && developerId != null && developerId.isNotEmpty) {
          map[id] = developerId;
        }
      }

      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return map;
  }

  Future<Set<String>> _loadExistingReviewUserIds(String productId) async {
    const pageSize = 1000;
    int from = 0;
    final userIds = <String>{};

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from('reviews')
          .select('user_id')
          .eq('product_id', productId)
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((row) => (row as Map)['user_id'])
          .whereType<String>()
          .toList();
      userIds.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return userIds;
  }

  List<String> _pickUniqueUsers({
    required List<String> profileIds,
    required Set<String> excludedUserIds,
    required int count,
  }) {
    final pool = profileIds
        .where((id) => !excludedUserIds.contains(id))
        .toList();
    pool.shuffle(_random);
    return pool.take(count).toList();
  }

  int _generateRating() {
    final roll = _random.nextDouble();
    // Более реалистичное распределение с большим числом негативных оценок.
    // 55% -> 4-5, 20% -> 3, 25% -> 1-2
    if (roll < 0.55) {
      return _random.nextBool() ? 4 : 5;
    }
    if (roll < 0.75) {
      return 3;
    }
    return _random.nextBool() ? 1 : 2;
  }

  int _calculateTargetReviews(_ProductInfo product) {
    final tierBase = switch (_pickPopularityTier()) {
      _PopularityTier.top => _randomInRange(300, 1200),
      _PopularityTier.high => _randomInRange(80, 300),
      _PopularityTier.mid => _randomInRange(15, 80),
      _PopularityTier.low => _randomInRange(0, 20),
    };

    final typeFactor = switch (product.type) {
      'app' => 1.2,
      'book' => 0.6,
      _ => 1.0, // game and fallback
    };
    final ageFactor = _ageFactor(product.releaseDate);
    final noise = _randomDoubleInRange(0.7, 1.4);
    final value = tierBase * typeFactor * ageFactor * noise;
    return max(0, value.round());
  }

  _PopularityTier _pickPopularityTier() {
    final roll = _random.nextDouble();
    if (roll < 0.05) return _PopularityTier.top;
    if (roll < 0.20) return _PopularityTier.high;
    if (roll < 0.55) return _PopularityTier.mid;
    return _PopularityTier.low;
  }

  double _ageFactor(DateTime? releaseDate) {
    if (releaseDate == null) return 1.0;
    final ageDays = DateTime.now().toUtc().difference(releaseDate.toUtc()).inDays;
    final normalized = (ageDays / 365.0).clamp(0.0, 3.0);
    return (0.4 + normalized * 0.3).clamp(0.4, 1.3);
  }

  DateTime? _parseDate(dynamic raw) {
    if (raw is String && raw.isNotEmpty) {
      return DateTime.tryParse(raw);
    }
    return null;
  }

  String _generateReviewText(int rating) {
    final useLong = _random.nextDouble() < 0.28;
    if (rating >= 4) {
      if (useLong) {
        return positiveLongReviewTemplates[_random.nextInt(
          positiveLongReviewTemplates.length,
        )];
      }
      return positiveReviewPhrases[_random.nextInt(
        positiveReviewPhrases.length,
      )];
    }
    if (rating == 3) {
      if (useLong) {
        return neutralLongReviewTemplates[_random.nextInt(
          neutralLongReviewTemplates.length,
        )];
      }
      return neutralReviewPhrases[_random.nextInt(neutralReviewPhrases.length)];
    }

    if (useLong) {
      return negativeLongReviewTemplates[_random.nextInt(
        negativeLongReviewTemplates.length,
      )];
    }
    return negativeReviewPhrases[_random.nextInt(negativeReviewPhrases.length)];
  }

  _DeveloperReply? _maybeGenerateDeveloperReply(
    _ProductInfo product,
    DateTime createdAt,
  ) {
    final isSoftware = product.type == 'app' || product.type == 'game';
    if (!isSoftware)
      return null; // Для книг ответа разработчика быть не должно.
    // Привязка к реальному владельцу конкретного software-продукта.
    final ownerDeveloperId = product.softwareDeveloperId;
    if (ownerDeveloperId == null || ownerDeveloperId.isEmpty) return null;
    if (_random.nextDouble() >= _developerReplyChance) return null;

    return _DeveloperReply(
      developerId: ownerDeveloperId,
      content:
          developerReplyPhrases[_random.nextInt(developerReplyPhrases.length)],
      responsedAt: _randomResponseDate(createdAt),
    );
  }

  DateTime _randomDateWithinLastMonths(DateTime nowUtc, int monthsBack) {
    final maxDays = monthsBack * 30;
    final daysAgo = _random.nextInt(maxDays + 1);
    final secondsAgo = _random.nextInt(24 * 60 * 60);
    return nowUtc.subtract(Duration(days: daysAgo, seconds: secondsAgo));
  }

  DateTime _randomResponseDate(DateTime createdAt) {
    final addDays = 1 + _random.nextInt(2); // 1-2 дня
    final addHours = _random.nextInt(24);
    final addMinutes = _random.nextInt(60);
    return createdAt.add(
      Duration(days: addDays, hours: addHours, minutes: addMinutes),
    );
  }

  int _randomInRange(int minValue, int maxValue) {
    if (maxValue <= minValue) return minValue;
    return minValue + _random.nextInt(maxValue - minValue + 1);
  }

  double _randomDoubleInRange(double minValue, double maxValue) {
    if (maxValue <= minValue) return minValue;
    return minValue + _random.nextDouble() * (maxValue - minValue);
  }

  Future<void> _batchInsertReviews(List<Map<String, dynamic>> rows) async {
    if (rows.isEmpty) return;
    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, (i + _batchSize).clamp(0, rows.length));
      await _client.schema(_contentSchema).from('reviews').insert(batch);
    }
  }

  void _printProgress(
    int current,
    int total,
    String productId,
    int insertedForProduct,
    int insertedTotal,
  ) {
    print(
      '[$current/$total] product=$productId, added=$insertedForProduct, total=$insertedTotal',
    );
  }
}

class _ProductInfo {
  const _ProductInfo({
    required this.id,
    required this.type,
    required this.releaseDate,
    required this.softwareDeveloperId,
  });

  final String id;
  final String type;
  final DateTime? releaseDate;
  final String? softwareDeveloperId;
}

enum _PopularityTier { top, high, mid, low }

class _DeveloperReply {
  const _DeveloperReply({
    required this.developerId,
    required this.content,
    required this.responsedAt,
  });

  final String developerId;
  final String content;
  final DateTime responsedAt;
}
