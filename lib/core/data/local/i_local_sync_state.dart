abstract interface class ILocalSyncState {
  Future<DateTime?> getLastSync(String syncKey);
  Future<void> setLastSync(String syncKey, DateTime at);
}
