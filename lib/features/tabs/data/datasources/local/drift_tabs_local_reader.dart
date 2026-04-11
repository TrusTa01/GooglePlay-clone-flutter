part of 'drift_tabs_local_datasource.dart';

class _DriftTabsLocalReader {
  final AppDatabase _db;

  const _DriftTabsLocalReader(this._db);

  Future<List<TabsEntity>> getTabs({
    required String id,
    required String locale,
    required int page,
    required int pageSize,
  }) async {
    final tabs =
        await (_db.select(_db.cachedTabs)
              ..where((t) => t.id.equals(id))
              ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
            .withPagination(page, pageSize)
            .get();

    return _getTabsEntity(tabs, locale);
  }

  Future<List<TabsEntity>> _getTabsEntity(
    List<CachedTab> tabs,
    String locale,
  ) => Future.value(
    tabs.isEmpty
        ? const <TabsEntity>[]
        : tabs.map((t) => t.toEntity(locale)).toList(),
  );
}
