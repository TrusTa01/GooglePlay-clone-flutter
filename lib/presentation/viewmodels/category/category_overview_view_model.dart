import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/viewmodels/category/category_overview_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_overview_view_model.g.dart';

class CategoryOverviewArgs {
  final String title;
  final String categoryKey;
  final List<ProductEntity> products;

  const CategoryOverviewArgs({
    required this.title,
    required this.categoryKey,
    required this.products,
  });
}

@riverpod
CategoryOverviewState categoryOverviewViewModel(
  Ref ref,
  CategoryOverviewArgs args,
) {
  final filtered = _filterProducts(args.products, args.categoryKey);
  return CategoryOverviewState(
    title: args.title,
    categoryKey: args.categoryKey,
    products: filtered,
  );
}

List<ProductEntity> _filterProducts(
  List<ProductEntity> products,
  String categoryKey,
) {
  if (_isAllCategory(categoryKey)) return List<ProductEntity>.from(products);
  return products.where((p) => p.categories.contains(categoryKey)).toList();
}

bool _isAllCategory(String key) {
  return key == 'categoryAll' || key == 'categoryBooksAll';
}
