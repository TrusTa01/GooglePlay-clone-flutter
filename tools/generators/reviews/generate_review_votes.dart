// ignore_for_file: avoid_print
//
// Генератор голосов за отзывы в content.review_votes.
//
// Запуск:
//   dart run tools/generate_review_votes.dart
//
// Требования:
//   - Файл .env в корне проекта с SUPABASE_URL и SUPABASE_SERVICE_ROLE_KEY
//
// Что делает:
//   1) Загружает все id+rating из content.reviews
//   2) Загружает все id из public.profiles
//   3) Выбирает 10-20% случайных отзывов
//   4) Для каждого выбранного отзыва генерирует 1-10 голосов
//   5) Следит за уникальностью пары (review_id, user_id)
//
import 'dart:io';
import 'dart:math';

import 'package:dotenv/dotenv.dart';
import 'package:supabase/supabase.dart';

const String _contentSchema = 'content';
const int _batchSize = 100;
const int _minVotesPerReview = 1;
const int _maxVotesPerReview = 10;
const double _minReviewsWithVotesRatio = 0.10;
const double _maxReviewsWithVotesRatio = 0.20;
const int _minTotalVotesTarget = 10000;
const int _maxTotalVotesTarget = 20000;
const double _highRatingUpvoteChance = 0.90; // rating >= 4
const double _lowRatingDownvoteChance = 0.60; // rating <= 2
const double _defaultUpvoteChance = 0.50; // rating == 3
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
  final generator = _ReviewVotesGenerator(client);

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

class _ReviewVotesGenerator {
  _ReviewVotesGenerator(this._client);

  final SupabaseClient _client;
  final Random _random = Random();

  Future<void> run() async {
    final reviews = await _loadReviews();
    final profileIds = await _loadProfileIds();

    if (reviews.isEmpty) {
      throw StateError('В content.reviews нет отзывов.');
    }
    if (profileIds.isEmpty) {
      throw StateError('В public.profiles нет пользователей.');
    }

    print('Всего отзывов: ${reviews.length}');
    print('Профилей: ${profileIds.length}');

    final shuffledReviews = List<_ReviewInfo>.from(reviews)..shuffle(_random);
    final ratio =
        _minReviewsWithVotesRatio +
        _random.nextDouble() *
            (_maxReviewsWithVotesRatio - _minReviewsWithVotesRatio);
    final selectedCount = max(
      1,
      min(shuffledReviews.length, (shuffledReviews.length * ratio).round()),
    );
    final selectedReviews = shuffledReviews.take(selectedCount).toList();
    final votesTarget = _randomInRange(
      _minTotalVotesTarget,
      _maxTotalVotesTarget,
    );
    print('Выбрано отзывов для голосов: ${selectedReviews.length}');
    print('Цель голосов: до $votesTarget');

    int totalInserted = 0;
    final pendingRows = <Map<String, dynamic>>[];

    for (int index = 0; index < selectedReviews.length; index++) {
      if (totalInserted >= votesTarget) break;
      final review = selectedReviews[index];
      final existingVoters = await _loadExistingVotersForReview(review.id);
      final usedPairsForReview = existingVoters
          .map((userId) => '${review.id}::$userId')
          .toSet();

      final maxAllowedVotes = profileIds.length - existingVoters.length;
      if (maxAllowedVotes <= 0) {
        _printProgress(
          index + 1,
          selectedReviews.length,
          review.id,
          0,
          totalInserted,
        );
        continue;
      }

      final targetVotes = _randomInRange(
        _minVotesPerReview,
        _maxVotesPerReview,
      );
      final votesCount = min(targetVotes, maxAllowedVotes);
      final voters = _pickUniqueUsers(
        allUserIds: profileIds,
        excludedUserIds: existingVoters,
        count: votesCount,
      );

      if (voters.isEmpty) {
        _printProgress(
          index + 1,
          selectedReviews.length,
          review.id,
          0,
          totalInserted,
        );
        continue;
      }

      int insertedForReview = 0;
      for (final userId in voters) {
        if (totalInserted + pendingRows.length >= votesTarget) break;
        final pairKey = '${review.id}::$userId';
        if (usedPairsForReview.contains(pairKey)) {
          continue;
        }

        final isUpvote = _generateIsUpvote(review.rating);
        pendingRows.add({
          'review_id': review.id,
          'user_id': userId,
          'is_upvote': isUpvote,
          'upvotes_count': isUpvote ? 1 : 0,
          'downvotes_count': isUpvote ? 0 : 1,
        });
        usedPairsForReview.add(pairKey);
        insertedForReview++;

        if (pendingRows.length >= _batchSize) {
          await _batchInsertVotes(pendingRows);
          totalInserted += pendingRows.length;
          pendingRows.clear();
        }
      }

      _printProgress(
        index + 1,
        selectedReviews.length,
        review.id,
        insertedForReview,
        totalInserted,
      );
    }

    if (pendingRows.isNotEmpty && totalInserted < votesTarget) {
      await _batchInsertVotes(pendingRows);
      totalInserted += pendingRows.length;
      pendingRows.clear();
    }

    print('Всего вставлено голосов: $totalInserted');
  }

  Future<List<_ReviewInfo>> _loadReviews() async {
    const pageSize = 1000;
    int from = 0;
    final reviews = <_ReviewInfo>[];

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from('reviews')
          .select('id,rating')
          .range(from, from + pageSize - 1);

      final batch = (response as List)
          .map((row) {
            final data = Map<String, dynamic>.from(row as Map);
            final id = data['id'] as String?;
            final ratingRaw = data['rating'];
            final rating = ratingRaw is int
                ? ratingRaw
                : int.tryParse('$ratingRaw');
            if (id == null || rating == null) return null;
            return _ReviewInfo(id: id, rating: rating);
          })
          .whereType<_ReviewInfo>()
          .toList();

      reviews.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return reviews;
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

  Future<Set<String>> _loadExistingVotersForReview(String reviewId) async {
    const pageSize = 1000;
    int from = 0;
    final voters = <String>{};

    while (true) {
      final response = await _client
          .schema(_contentSchema)
          .from('review_votes')
          .select('user_id')
          .eq('review_id', reviewId)
          .range(from, from + pageSize - 1);
      final batch = (response as List)
          .map((row) => (row as Map)['user_id'])
          .whereType<String>()
          .toList();
      voters.addAll(batch);
      if (batch.length < pageSize) break;
      from += pageSize;
    }

    return voters;
  }

  List<String> _pickUniqueUsers({
    required List<String> allUserIds,
    required Set<String> excludedUserIds,
    required int count,
  }) {
    final pool = allUserIds
        .where((id) => !excludedUserIds.contains(id))
        .toList();
    pool.shuffle(_random);
    return pool.take(count).toList();
  }

  int _randomInRange(int minValue, int maxValue) {
    if (maxValue <= minValue) return minValue;
    return minValue + _random.nextInt(maxValue - minValue + 1);
  }

  bool _generateIsUpvote(int rating) {
    if (rating >= 4) {
      return _random.nextDouble() < _highRatingUpvoteChance;
    }
    if (rating <= 2) {
      return _random.nextDouble() >= _lowRatingDownvoteChance;
    }
    return _random.nextDouble() < _defaultUpvoteChance;
  }

  Future<void> _batchInsertVotes(List<Map<String, dynamic>> rows) async {
    if (rows.isEmpty) return;
    for (int i = 0; i < rows.length; i += _batchSize) {
      final batch = rows.sublist(i, min(i + _batchSize, rows.length));
      await _client.schema(_contentSchema).from('review_votes').insert(batch);
    }
  }

  void _printProgress(
    int current,
    int total,
    String reviewId,
    int insertedForReview,
    int insertedTotal,
  ) {
    print(
      '[$current/$total] review=$reviewId, added=$insertedForReview, total=$insertedTotal',
    );
  }
}

class _ReviewInfo {
  const _ReviewInfo({required this.id, required this.rating});

  final String id;
  final int rating;
}
