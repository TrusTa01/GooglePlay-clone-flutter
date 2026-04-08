import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/products/junctions/tags/tags.dart';
import 'package:google_play/core/local_database/tables/products/cached_product.dart';

class ProductTags extends Table {
  TextColumn get productId => text().references(
        CachedProduct,
        #id,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get tagId => text().references(
        Tags,
        #id,
        onDelete: KeyAction.cascade,
      )();

  @override
  Set<Column> get primaryKey => {productId, tagId};
}
