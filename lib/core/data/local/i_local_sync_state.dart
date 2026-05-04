/// Поля синхронизации по [syncKey] для политик свежести и backoff
typedef SyncTimestamps = ({
  DateTime? lastSyncAt,
  DateTime? lastFailureAt,
  int failureCount,
});

abstract interface class ILocalSyncState {
  Future<SyncTimestamps> getSyncTimestamps(String syncKey);

  Future<DateTime?> getLastSync(String syncKey);

  Future<String?> getSyncCursor(String syncKey);

  // Успешная синхронизация: время успеха и сброс полей backoff
  Future<void> setLastSync(String syncKey, DateTime at);

  Future<void> setSyncCursor(String syncKey, String? cursor);

  /// Ошибка загрузки: увеличить [failureCount], обновить [lastFailureAt]
  Future<void> recordSyncFailure(String syncKey);
}
