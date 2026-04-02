import 'package:drift/drift.dart';

class SyncState extends Table {
  TextColumn get syncKey => text().named('sync_key')();
  DateTimeColumn get lastSyncAt =>
      dateTime().named('last_sync_at').nullable()();
  TextColumn get cursor => text().nullable()();
  IntColumn get remoteSchemaVersion =>
      integer().named('remote_schema_version').nullable()();

  @override
  Set<Column> get primaryKey => {syncKey};
}
