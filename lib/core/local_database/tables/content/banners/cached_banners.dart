import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/shared/converters.dart';

class CachedBanners extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get imageAssetPath => text()();
  TextColumn get title =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  TextColumn get topTooltipText =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  TextColumn get description =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
