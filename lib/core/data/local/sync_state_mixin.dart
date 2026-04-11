import 'package:drift/drift.dart';
import 'package:google_play/core/local_database/app_database.dart';

abstract mixin class SyncStateMixin {
  AppDatabase get db;

  Future<DateTime?> getLastSync(String syncKey) async {
    final row = await (db.select(
      db.syncState,
    )..where((t) => t.syncKey.equals(syncKey))).getSingleOrNull();
    return row?.lastSyncAt;
  }

  Future<void> setLastSync(String syncKey, DateTime at) async {
    await db
        .into(db.syncState)
        .insertOnConflictUpdate(
          SyncStateCompanion.insert(syncKey: syncKey, lastSyncAt: Value(at)),
        );
  }
}
