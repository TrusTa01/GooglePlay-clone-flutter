import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/content/banners/cached_banners.dart';
import 'package:google_play/core/local_database/shared/converters.dart';

class CachedEventBanners extends Table {
  TextColumn get bannerId => text().references(CachedBanners, #id)();
  TextColumn get eventId => text().nullable()();
  TextColumn get eventCategory => text().nullable()();
  TextColumn get eventDescription =>
      text().nullable().map(const LocalizedStringNullableConverter())();

  @override
  Set<Column> get primaryKey => {bannerId};
}
