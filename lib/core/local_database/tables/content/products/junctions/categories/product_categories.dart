import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/content/products/junctions/categories/categories.dart';
import 'package:google_play/core/local_database/tables/content/products/cached_product.dart';

class ProductCategories extends Table {
  TextColumn get productId => text().references(
        CachedProduct,
        #id,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get categoryId => text().references(
        Categories,
        #id,
        onDelete: KeyAction.cascade,
      )();

  @override
  Set<Column> get primaryKey => {productId, categoryId};
}
