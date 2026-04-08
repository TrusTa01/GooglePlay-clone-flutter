import 'package:drift/drift.dart';

class CachedBanners extends Table {
  TextColumn get id => text().named('id')();
  TextColumn get type => text().named('type')();
  TextColumn get imageAssetPath => text().named('image_asset_path')();
  TextColumn get title => text().named('title').nullable()();
  TextColumn get topTooltipText =>
      text().named('top_tooltip_text').nullable()();
  TextColumn get description => text().named('type').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
