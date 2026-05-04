import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/content/banners/cached_banners.dart';
import 'package:google_play/core/local_database/tables/content/products/cached_product.dart';

class CachedActionBanners extends Table {
  @ReferenceName('cached_action_banner_by_banner_id')
  TextColumn get bannerId => text().references(CachedBanners, #id)();
  @ReferenceName('cached_action_banner_by_product_external_id')
  TextColumn get productExternalId =>
      text().references(CachedProduct, #externalId)();

  @override
  Set<Column> get primaryKey => {bannerId};
}
