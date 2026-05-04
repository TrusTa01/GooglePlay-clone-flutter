part of 'drift_sections_local_data_source.dart';

class _DriftSectionsLocalReader {
  final AppDatabase _db;

  _DriftSectionsLocalReader(this._db);

  Future<List<SectionEntity>> getSections({
    required String tabId,
    required String locale,
    required int page,
    required int pageSize,
  }) async {
    // `tabId` request param is either API `tab_id` (UUID → CachedTabs.id) or
    // `tab_key` (e.g. recommended). Rows store both columns; match either.
    final sections =
        await (_db.select(_db.cachedSections)
              ..where(
                (s) => s.tabId.equals(tabId) | s.tabKey.equals(tabId),
              )
              ..orderBy([(s) => OrderingTerm.asc(s.sortOrder)]))
            .withPagination(page, pageSize)
            .get();

    return _getSectionsEntity(sections, locale);
  }

  Future<List<SectionEntity>> _getSectionsEntity(
    List<CachedSection> sections,
    String locale,
  ) => Future.value(
    sections.isEmpty
        ? const <SectionEntity>[]
        : sections.map((s) => s.toEntity(locale)).toList(),
  );
}
