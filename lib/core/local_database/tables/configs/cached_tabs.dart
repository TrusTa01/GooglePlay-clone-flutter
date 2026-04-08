import 'package:drift/drift.dart';

class CachedTabs extends Table {
  TextColumn get id => text()();
  TextColumn get contentType => text()();
  TextColumn get tabKey => text()();
  TextColumn get labelKey => text()();
  TextColumn get tabType => text()();
  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  @override
  Set<TextColumn> get primaryKey => {id};
}
