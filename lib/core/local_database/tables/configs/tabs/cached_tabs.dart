import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/shared/converters.dart';

class CachedTabs extends Table {
  TextColumn get id => text()();
  TextColumn get contentType => text()();
  TextColumn get tabKey => text()();
  TextColumn get label => text().map(const LocalizedStringConverter())();
  TextColumn get tabType => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
