import 'package:drift/drift.dart';
import 'package:google_play/core/data/local/i_local_sync_state.dart';
import 'package:google_play/core/local_database/app_database.dart';

abstract mixin class SyncStateMixin implements ILocalSyncState {
  AppDatabase get db;

  @override
  Future<SyncTimestamps> getSyncTimestamps(String syncKey) async {
    final row = await (db.select(
      db.syncState,
    )..where((t) => t.syncKey.equals(syncKey))).getSingleOrNull();
    return (
      lastSyncAt: row?.lastSyncAt,
      lastFailureAt: row?.lastFailureAt,
      failureCount: row?.failureCount ?? 0,
    );
  }

  @override
  Future<DateTime?> getLastSync(String syncKey) async {
    final t = await getSyncTimestamps(syncKey);
    return t.lastSyncAt;
  }

  @override
  Future<void> setLastSync(String syncKey, DateTime at) async {
    await db.into(db.syncState).insertOnConflictUpdate(
      SyncStateCompanion.insert(
        syncKey: syncKey,
        lastSyncAt: Value(at),
        lastFailureAt: const Value(null),
        failureCount: const Value(0),
      ),
    );
  }

  @override
  Future<void> recordSyncFailure(String syncKey) async {
    final row = await (db.select(
      db.syncState,
    )..where((t) => t.syncKey.equals(syncKey))).getSingleOrNull();
    final count = (row?.failureCount ?? 0) + 1;
    await db.into(db.syncState).insertOnConflictUpdate(
      SyncStateCompanion(
        syncKey: Value(syncKey),
        lastSyncAt: Value(row?.lastSyncAt),
        lastFailureAt: Value(DateTime.now()),
        failureCount: Value(count),
        cursor: Value(row?.cursor),
        remoteSchemaVersion: Value(row?.remoteSchemaVersion),
      ),
    );
  }
}
