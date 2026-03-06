import 'package:google_play/domain/entities/products/product_filter.dart';

sealed class SectionDataSource {
  const SectionDataSource();
}

final class ProductListSource extends SectionDataSource {
  final List<ProductFilter> filters;
  const ProductListSource(this.filters);
}

final class BannersSource extends SectionDataSource {
  final String prefix;
  const BannersSource(this.prefix);
}
