part of 'drift_tabs_local_datasource.dart';

class _DriftTabsLocalWritter extends BaseDriftWriter<TabsDto> {
  const _DriftTabsLocalWritter(super.db);

  @override
  Future<void> upsertOne(TabsDto dto) {
    final row = CachedTabsCompanion.insert(
      id: dto.id,
      contentType: dto.contentType,
      tabKey: dto.tabKey,
      label: dto.label,
      tabType: dto.tabType,
      sortOrder: Value(dto.sortOrder),
    );

    return db.into(db.cachedTabs).insertOnConflictUpdate(row);
  }
}
