sealed class ProductFilter {
  const ProductFilter();
}

final class CategoryFilter extends ProductFilter {
  final String genre;
  const CategoryFilter({required this.genre});
}

final class TagFilter extends ProductFilter {
  final String tag;
  const TagFilter({required this.tag});
}

final class IsPaidFilter extends ProductFilter {
  final bool isPaid;
  const IsPaidFilter({required this.isPaid});
}

final class AgeLimitFilter extends ProductFilter {
  final int age;
  const AgeLimitFilter({required this.age});
}

final class UnknownFilter extends ProductFilter {
  const UnknownFilter();
}
