import 'package:google_play/domain/entities/products/product_entity.dart';

class CategoryOverviewState {
  final String title;
  final String categoryKey;
  final List<ProductEntity> products;

  const CategoryOverviewState({
    required this.title,
    required this.categoryKey,
    required this.products,
  });
}
