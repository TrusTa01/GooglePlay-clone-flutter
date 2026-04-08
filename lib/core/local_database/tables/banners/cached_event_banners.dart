import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/app_database.dart';

class CachedEventBanners extends Table {
  TextColumn get bannerId => text().references(CachedBanner, #id)();
  TextColumn get eventId => text().nullable()();
  TextColumn get eventCategory => text().nullable()();
  TextColumn get eventDescription => text().nullable()();

  @override
  Set<Column> get primaryKey => {bannerId};
}
