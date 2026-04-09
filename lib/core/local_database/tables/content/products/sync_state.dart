import 'package:drift/drift.dart';

class SyncState extends Table {
  TextColumn get syncKey => text()();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();
  TextColumn get cursor => text().nullable()();
  IntColumn get remoteSchemaVersion => integer().nullable()();

  @override
  Set<Column> get primaryKey => {syncKey};
}
