import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/shared/converters.dart';
import 'package:google_play/core/local_database/tables/content/products/cached_software_product.dart';

class CachedGames extends Table {
  TextColumn get productId => text().references(
    CachedSoftwareProduct,
    #productId,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get technicalInfo => text().nullable()();
  BoolColumn get isOnline => boolean().nullable()();
  BoolColumn get hasMultiplayer => boolean().nullable()();
  TextColumn get gameModes => text().nullable()();
  BoolColumn get hasControllerSupport => boolean().nullable()();
  TextColumn get achievements =>
      text().nullable().map(const LocalizedStringListNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
