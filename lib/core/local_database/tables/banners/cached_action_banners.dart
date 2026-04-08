import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/products/products/cached_product.dart';

class CachedActionBanners extends Table {
  TextColumn get bannerId =>
      text().named('banner_id').references(CachedProduct, #id)();
  TextColumn get productExternalId => text()
      .named('product_external_id')
      .references(CachedProduct, #external_id)();

  @override
  Set<Column> get primaryKey => {bannerId};
}
