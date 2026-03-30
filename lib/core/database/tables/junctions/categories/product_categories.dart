import 'package:drift/drift.dart';
import 'package:google_play/core/database/tables/junctions/categories/categories.dart';
import 'package:google_play/core/database/tables/products/cached_product.dart';

class ProductCategories extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get categoryId => text()
      .named('category_id')
      .references(Categories, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {productId, categoryId};
}
