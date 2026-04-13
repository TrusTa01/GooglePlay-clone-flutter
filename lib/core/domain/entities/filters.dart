sealed class Filter {
  const Filter();
}

final class RecommendedFilter extends Filter {
  final List<String> productIds;

  const RecommendedFilter({required this.productIds});
}

final class CategoryFilter extends Filter {
  final String genre;

  const CategoryFilter({required this.genre});
}

final class CollectionFilter extends Filter {
  final String collectionName;

  CollectionFilter({required this.collectionName});
}

final class TagFilter extends Filter {
  final String tag;

  const TagFilter({required this.tag});
}

final class IsPaidFilter extends Filter {
  final bool isPaid;

  const IsPaidFilter({required this.isPaid});
}

final class AgeLimitFilter extends Filter {
  final int age;

  const AgeLimitFilter({required this.age});
}

final class UnknownFilter extends Filter {
  const UnknownFilter();
}
