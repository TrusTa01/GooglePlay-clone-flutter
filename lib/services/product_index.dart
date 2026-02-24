import 'package:google_play/data/models/dtos.dart';

/// Ключи возрастных бакетов для индекса (совпадают с лейблами из конфигов).
const List<String> _ageBucketKeys = ['0-5', '6-8', '9-12', '13+'];

/// Возвращает ключ бакета по ageRating (0-5 -> "0-5", 6-8 -> "6-8", 9-12 -> "9-12", 13+ -> "13+").
String _ageBucketKey(int ageRating) {
  if (ageRating <= 5) return '0-5';
  if (ageRating <= 8) return '6-8';
  if (ageRating <= 12) return '9-12';
  return '13+';
}

/// Предвычисленные индексы для быстрого доступа к продуктам по жанру, тегу, возрасту.
/// Строится один раз при загрузке данных (O(n)), запросы затем O(1) или O(размер выборки).
class ProductIndex {
  ProductIndex._({
    required this.allProducts,
    required this.gamesByGenre,
    required this.booksByGenre,
    required this.productsByTag,
    required this.byAgeBucket,
    required this.recommendationsByAgeBucket,
    required this.paidGames,
    required this.offlineGames,
    required this.ebooksByTag,
  });

  final List<Product> allProducts;
  final Map<String, List<Game>> gamesByGenre;
  final Map<String, List<Book>> booksByGenre;
  final Map<String, List<Product>> productsByTag;
  final Map<String, List<Product>> byAgeBucket;
  final Map<String, List<Product>> recommendationsByAgeBucket;
  final List<Game> paidGames;
  final List<Game> offlineGames;

  /// Индекс по тегу только для книг-ebook (для getEbooksByTag).
  final Map<String, List<Book>> ebooksByTag;

  /// Строит индекс одним проходом по [products] и [recommendations].
  static ProductIndex build(
    List<Product> products,
    List<Product> recommendations,
  ) {
    final gamesByGenre = <String, List<Game>>{};
    final booksByGenre = <String, List<Book>>{};
    final productsByTag = <String, List<Product>>{};
    final ebooksByTag = <String, List<Book>>{};
    final byAgeBucket = <String, List<Product>>{
      for (final k in _ageBucketKeys) k: [],
    };
    final recommendationsByAgeBucket = <String, List<Product>>{
      for (final k in _ageBucketKeys) k: [],
    };
    final paidGames = <Game>[];
    final offlineGames = <Game>[];

    void addToMap<K, V>(Map<K, List<V>> map, K key, V value) {
      map.putIfAbsent(key, () => []).add(value);
    }

    String norm(String s) => s.trim().toLowerCase();

    for (final p in products) {
      if (p is Game) {
        for (final g in p.categories) {
          addToMap(gamesByGenre, norm(g), p);
        }
        for (final t in p.tags) {
          addToMap(productsByTag, norm(t), p);
        }
        for (final g in p.categories) {
          addToMap(productsByTag, norm(g), p);
        }
        addToMap(byAgeBucket, _ageBucketKey(p.ageRating), p);
        if (p.isPaid) paidGames.add(p);
        if (!p.isOnline) offlineGames.add(p);
      } else if (p is App) {
        for (final t in p.tags) {
          addToMap(productsByTag, norm(t), p);
        }
        addToMap(byAgeBucket, _ageBucketKey(p.ageRating), p);
      } else if (p is Book) {
        for (final g in p.categories) {
          addToMap(booksByGenre, norm(g), p);
        }
        for (final t in p.tags) {
          addToMap(productsByTag, norm(t), p);
        }
        for (final g in p.categories) {
          addToMap(productsByTag, norm(g), p);
        }
        if (p.isEbook) {
          for (final g in p.categories) {
            addToMap(ebooksByTag, norm(g), p);
          }
          for (final t in p.tags) {
            addToMap(ebooksByTag, norm(t), p);
          }
        }
      }
    }

    for (final p in recommendations) {
      if (p is Game || p is App) {
        final age = p.ageRating ?? 0;
        addToMap(recommendationsByAgeBucket, _ageBucketKey(age), p);
      }
    }

    return ProductIndex._(
      allProducts: products,
      gamesByGenre: gamesByGenre,
      booksByGenre: booksByGenre,
      productsByTag: productsByTag,
      byAgeBucket: byAgeBucket,
      recommendationsByAgeBucket: recommendationsByAgeBucket,
      paidGames: paidGames,
      offlineGames: offlineGames,
      ebooksByTag: ebooksByTag,
    );
  }
}
