import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/converters.dart';
import 'package:google_play/core/local_database/tables/products/cached_software_product.dart';

class CachedGames extends Table {
  TextColumn get productId => text()
      .named('product_id')
      .references(
        CachedSoftwareProduct,
        #productId,
        onDelete: KeyAction.cascade,
      )();
  TextColumn get technicalInfo => text().named('technical_info').nullable()();
  BoolColumn get isOnline => boolean().named('is_online').nullable()();
  BoolColumn get hasMultiplayer =>
      boolean().named('has_multiplayer').nullable()();
  TextColumn get gameModes => text().named('game_modes').nullable()();
  BoolColumn get hasControllerSupport =>
      boolean().named('has_controller_support').nullable()();
  TextColumn get achievements => text()
      .named('achievements')
      .nullable()
      .map(const LocalizedStringListNullableConverter())();

  @override
  Set<Column> get primaryKey => {productId};
}
