import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/junctions/tags/tags.dart';
import 'package:google_play/core/local_database/tables/products/cached_product.dart';

class ProductTags extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get tagId => text()
      .named('tag_id')
      .references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {productId, tagId};
}
