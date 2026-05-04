part of 'drift_tabs_local_data_source.dart';

class _DriftTabsLocalReader {
  final AppDatabase _db;

  const _DriftTabsLocalReader(this._db);

  Future<List<TabsEntity>> getTabs({
    required ProductKind productKind,
    required String locale,
    required int page,
    required int pageSize,
  }) async {
    final tabs =
        await (_db.select(_db.cachedTabs)
              ..where((t) => t.contentType.equals(productKind.name))
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
