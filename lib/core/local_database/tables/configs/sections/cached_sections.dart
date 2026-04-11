import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/tables/configs/tabs/cached_tabs.dart';
import 'package:google_play/core/local_database/tables/shared/converters.dart';

class CachedTabSections extends Table {
  TextColumn get id => text()();
  TextColumn get tabId =>
      text().references(CachedTabs, #id, onDelete: KeyAction.cascade)();
  TextColumn get sectionType => text()();
  TextColumn get title =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  TextColumn get subtitle =>
      text().nullable().map(const LocalizedStringNullableConverter())();
  TextColumn get dataSource => text()();
  TextColumn get params => text().nullable()();
  TextColumn get imageAssetPath => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get contentType => text()();
  TextColumn get tabKey => text()();
  TextColumn get sectionKey => text()();

  @override
  Set<Column> get primaryKey => {id};
}
