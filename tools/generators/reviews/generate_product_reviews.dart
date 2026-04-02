// ignore_for_file: avoid_print
//
// Генератор отзывов в JSON-файл (assets/data/reviews.json).
//
// Запуск:
//   dart run tools/generators/reviews/generate_product_reviews.dart
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
//   6) Записывает результат в assets/data/reviews.json (без загрузки в облако)

import 'dart:io';
import 'dart:convert';
import 'dart:math';

import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';
import 'reviews_text_data.dart';

// Developer replies тоже занимают место, слегка уменьшаем шанс,
// чтобы уложиться в бюджет по размеру.
const double _developerReplyChance = 0.08;

// Распределение количества отзывов по продуктам.
// Цель: при больших объёмах (например, 30k продуктов) снизить суммарное число отзывов.
//
// - "Большие": 100-150 отзывов (чуть реже)
// - "Средние": 5-15 отзывов
// - "Маленькие": 0-5 отзывов
//
// Чтобы отзывов было больше (при этом оставляя длинный хвост),
// усиливаем "large" tier:
// Цель: уложиться по размеру в ~260 МБ (для больших объёмов продуктов).
// Слишком большие tier'ы приводили к гигантским JSON-файлам.
//
// - "Большие": 100-250
// - "Средние": 5-15
// - "Маленькие": 0-5
const double _largeProductChance = 0.15; // 15%
const double _mediumProductChance = 0.20; // 20%
const double _smallProductChance = 1.0 - _largeProductChance - _mediumProductChance; // 65%

const int _smallReviewsMin = 0;
const int _smallReviewsMax = 5;
const int _mediumReviewsMin = 5;
const int _mediumReviewsMax = 15;
const int _largeReviewsMin = 100;
const int _largeReviewsMax = 250;

// Длинные тексты заметно раздувают итоговый размер файла.
const double _useLongProbability = 0.18; // было 0.28

// Очень грубая оценка накладных расходов строки/TOAST+индексов в байтах.
// Нужна только чтобы примерно уложиться в бюджет по размеру.
const int _rowFixedOverheadBytes = 160;

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
    final products = await _loadLocalProducts();

    if (profileIds.isEmpty) {
      throw StateError('В public.profiles нет пользователей.');
    }
    if (products.isEmpty) {
      throw StateError(
        'Не удалось загрузить продукты из assets/data (games/apps/books).',
      );
    }

    print('Профилей: ${profileIds.length}');
    print('Продуктов: ${products.length}');

    // Прикидка объёма данных: сильно грубо, но помогает уложиться в бюджет.
    final expectedPerProduct =
        _largeProductChance * ((_largeReviewsMin + _largeReviewsMax) / 2) +
        _mediumProductChance * ((_mediumReviewsMin + _mediumReviewsMax) / 2) +
        _smallProductChance * ((_smallReviewsMin + _smallReviewsMax) / 2);
    final expectedTotalReviews = products.length * expectedPerProduct;

    // avg(content bytes) с учётом вероятностей рейтингов и long/short.
    const useLongProbability = _useLongProbability;
    const pHigh = 0.55; // rating 4-5
    const pMid = 0.20; // rating 3
    const pLow = 0.25; // rating 1-2

    final avgPosShortBytes = _avgUtf8Bytes(positiveReviewPhrases);
    final avgNeuShortBytes = _avgUtf8Bytes(neutralReviewPhrases);
    final avgNegShortBytes = _avgUtf8Bytes(negativeReviewPhrases);
    final avgPosLongBytes = _avgUtf8Bytes(positiveLongReviewTemplates);
    final avgNeuLongBytes = _avgUtf8Bytes(neutralLongReviewTemplates);
    final avgNegLongBytes = _avgUtf8Bytes(negativeLongReviewTemplates);

    final avgShortBytes =
        pHigh * avgPosShortBytes + pMid * avgNeuShortBytes + pLow * avgNegShortBytes;
    final avgLongBytes =
        pHigh * avgPosLongBytes + pMid * avgNeuLongBytes + pLow * avgNegLongBytes;
    final avgContentBytes = (1 - useLongProbability) * avgShortBytes +
        useLongProbability * avgLongBytes;

    // Developer content появляется только для app/game.
    final softwareProductsCount =
        products.where((p) => p.type == 'app' || p.type == 'game').length;
    final developerReplyAppliedChance = products.isEmpty
        ? 0.0
        : (softwareProductsCount / products.length) * _developerReplyChance;

    final avgDeveloperContentBytes = _avgUtf8Bytes(developerReplyPhrases);

    final avgRowBytes = _rowFixedOverheadBytes +
        avgContentBytes +
        developerReplyAppliedChance * avgDeveloperContentBytes;
    final estimatedTotalBytes = expectedTotalReviews * avgRowBytes;
    final estimatedMb = estimatedTotalBytes / 1e6;

    print(
      'Оценка: ~${expectedTotalReviews.toStringAsFixed(0)} отзывов, ориентировочно ~${estimatedMb.toStringAsFixed(1)} МБ (очень грубо).',
    );

    final now = DateTime.now().toUtc();
    var totalWritten = 0;

    final outFile = File('assets/data/reviews.json');
    if (!await outFile.parent.exists()) {
      await outFile.parent.create(recursive: true);
    }
    // Важно: файл выходит в NDJSON-формате (1 JSON-объект на строку),
    // чтобы можно было безопасно загрузить большие объёмы без OOM.
    final sink = outFile.openWrite();

    for (int index = 0; index < products.length; index++) {
      final product = products[index];
      final productExternalId = product.externalId;

      final targetCount = _calculateTargetReviews(product);
      final toGenerate = min(targetCount, profileIds.length);

      if (toGenerate <= 0) {
      _printProgress(
        index + 1,
        products.length,
        productExternalId,
        0,
        totalWritten,
      );
        continue;
      }

      final chosenUsers = _pickUniqueUsers(
        profileIds: profileIds,
        excludedUserIds: const <String>{},
        count: toGenerate,
      );

      for (final userId in chosenUsers) {
        final createdAt = _randomDateWithinLastMonths(now, 12);
        final rating = _generateRating();
        final reply = _maybeGenerateDeveloperReply(product, createdAt);

        final row = <String, dynamic>{
          // В JSON храним внешний id продукта.
          // upload_data() потом сопоставит его с реальным products.id в БД.
          'product_external_id': productExternalId,
          'user_id': userId,
          'rating': rating,
          'content': _generateReviewText(rating),
          'developer_content': reply?.content,
          'responsed_at': reply?.responsedAt.toIso8601String(),
          'created_at': createdAt.toIso8601String(),
        };

        sink.writeln(jsonEncode(row));
        totalWritten += 1;
      }

      final writtenForProduct = chosenUsers.length;
      _printProgress(
        index + 1,
        products.length,
        productExternalId,
        writtenForProduct,
        totalWritten,
      );
    }

    await sink.close();

    print('Всего сгенерировано отзывов: $totalWritten');
    print('Файл: ${outFile.path}');
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

  Future<List<_ProductInfo>> _loadLocalProducts() async {
    final items = <_ProductInfo>[];

    Future<void> loadFile(String path) async {
      final file = File(path);
      if (!await file.exists()) return;
      final content = await file.readAsString();
      final decoded = jsonDecode(content) as List<dynamic>;
      for (final raw in decoded) {
        if (raw is! Map) continue;
        final externalId = raw['id'] as String?;
        final type = raw['type'] as String?;
        if (externalId == null || type == null) continue;
        if (type != 'app' && type != 'game' && type != 'book') continue;
        items.add(_ProductInfo(externalId: externalId, type: type));
      }
    }

    await loadFile('assets/data/games.json');
    await loadFile('assets/data/apps.json');
    await loadFile('assets/data/books.json');

    return items;
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
    // Детерминируем tier по вероятностям, как просили:
    // - немного продуктов со 100-150 отзывами
    // - средние со 5-15
    // - маленькие со 0-5
    final roll = _random.nextDouble();
    if (roll < _largeProductChance) {
      return _randomInRange(_largeReviewsMin, _largeReviewsMax);
    }
    if (roll < _largeProductChance + _mediumProductChance) {
      return _randomInRange(_mediumReviewsMin, _mediumReviewsMax);
    }
    return _randomInRange(_smallReviewsMin, _smallReviewsMax);
  }

  String _generateReviewText(int rating) {
    final useLong = _random.nextDouble() < _useLongProbability;
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
    if (!isSoftware) {
      return null; // Для книг ответа разработчика быть не должно.
    }
    if (_random.nextDouble() >= _developerReplyChance) return null;

    return _DeveloperReply(
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

  double _avgUtf8Bytes(List<String> values) {
    if (values.isEmpty) return 0.0;
    var total = 0;
    for (final s in values) {
      total += utf8.encode(s).length;
    }
    return total / values.length;
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
    required this.externalId,
    required this.type,
  });

  final String externalId;
  final String type;
}

class _DeveloperReply {
  const _DeveloperReply({
    required this.content,
    required this.responsedAt,
  });

  final String content;
  final DateTime responsedAt;
}
