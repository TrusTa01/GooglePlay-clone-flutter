import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/content/banners/cached_banners.dart';

class BannersTranslations extends Table {
  TextColumn get bannerId =>
      text().references(CachedBanners, #id, onDelete: KeyAction.cascade)();
  TextColumn get field => text()();
  TextColumn get language => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {bannerId, field, language};
}
