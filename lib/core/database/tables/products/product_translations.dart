import 'package:drift/drift.dart';
import 'package:google_play/core/database/tables/products/cached_product.dart';

class ProductTranslations extends Table {
  TextColumn get productId =>
      text().references(CachedProduct, #id, onDelete: KeyAction.cascade)();
  TextColumn get field => text()();
  TextColumn get language => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {productId, field, language};
}
