sealed class ProductFilter {
  const ProductFilter();
}

sealed class BannerFilter {
  const BannerFilter();
}

final class RecommendedFilter extends ProductFilter {
  const RecommendedFilter();
}

final class CategoryFilter extends ProductFilter {
  final String genre;
  const CategoryFilter({required this.genre});
}

final class CollectionFilter extends ProductFilter {
  final String collectionName;
  CollectionFilter({required this.collectionName});
}

final class TagFilter extends ProductFilter {
  final String tag;
  const TagFilter({required this.tag});
}

final class IsPaidFilter extends ProductFilter {
  final bool isPaid;
  const IsPaidFilter({required this.isPaid});
}

final class UnknownFilter extends ProductFilter {
  const UnknownFilter();
}
