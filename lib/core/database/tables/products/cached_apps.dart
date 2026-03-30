import 'package:drift/drift.dart';
import 'package:google_play/core/database/tables/products/cached_software_product.dart';

class CachedApps extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(
        CachedSoftwareProduct,
        #productId,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get packageName => text().named('package_name')();

  @override
  Set<Column> get primaryKey => {productId};
}
