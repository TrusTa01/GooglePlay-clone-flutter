import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/entities/software_entity.dart';

sealed class ProductSort {
  const ProductSort();

  int compare(ProductEntity a, ProductEntity b);

  List<ProductEntity> sort(List<ProductEntity> products) {
    final sorted = List<ProductEntity>.from(products);
    sorted.sort(compare);
    return sorted;
  }
}

final class Popular extends ProductSort {
  const Popular();

  @override
  int compare(ProductEntity a, ProductEntity b) {
    final scoreA = _popularityScore(a);
    final scoreB = _popularityScore(b);
    return scoreB.compareTo(scoreA);
  }

  double _popularityScore(ProductEntity product) => switch (product) {
    SoftwareEntity s => s.downloadCount + (s.ratingAvg * 1000) + s.reviewsCount,
    BookEntity b => (b.ratingAvg * 1000) + b.reviewsCount,
    _ => product.reviewsCount.toDouble(),
  };
}

final class TopRated extends ProductSort {
  const TopRated();

  @override
  int compare(ProductEntity a, ProductEntity b) {
    final byRating = b.ratingAvg.compareTo(a.ratingAvg);
    if (byRating != 0) return byRating;
    return b.reviewsCount.compareTo(a.reviewsCount);
  }
}

final class NewRelease extends ProductSort {
  const NewRelease();

  @override
  int compare(ProductEntity a, ProductEntity b) {
    final byReleaseDate = b.releaseDate.compareTo(a.releaseDate);
    if (byReleaseDate != 0) return byReleaseDate;
    return b.ratingAvg.compareTo(a.ratingAvg);
  }
}

final class LastUpdated extends ProductSort {
  const LastUpdated();

  @override
  int compare(ProductEntity a, ProductEntity b) {
    final dateA = _updatedAt(a);
    final dateB = _updatedAt(b);
    final byUpdateDate = dateB.compareTo(dateA);
    if (byUpdateDate != 0) return byUpdateDate;
    return b.ratingAvg.compareTo(a.ratingAvg);
  }

  DateTime _updatedAt(ProductEntity product) => switch (product) {
    SoftwareEntity s => s.lastUpdated,
    _ => product.releaseDate,
  };
}
