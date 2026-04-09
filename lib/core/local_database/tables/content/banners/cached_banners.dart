import 'package:drift/drift.dart';

class CachedBanners extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get imageAssetPath => text()();
  TextColumn get title => text().nullable()();
  TextColumn get topTooltipText => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
