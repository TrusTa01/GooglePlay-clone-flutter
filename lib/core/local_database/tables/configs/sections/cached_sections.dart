import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/configs/tabs/cached_tabs.dart';

class CachedTabSections extends Table {
  TextColumn get id => text()();
  TextColumn get tabId => text().nullable().references(
    CachedTabs,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get sectionType => text()();
  TextColumn get titleKey => text().nullable()();
  TextColumn get subtitleKey => text().nullable()();
  TextColumn get dataSource => text().nullable()();
  TextColumn get params => text().nullable()();
  TextColumn get imageAssetPath => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get contentType => text().nullable()();
  TextColumn get tabKey => text().nullable()();
  TextColumn get sectionKey => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
