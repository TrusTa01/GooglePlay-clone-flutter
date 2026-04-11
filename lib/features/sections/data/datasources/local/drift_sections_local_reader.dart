part of 'drift_sections_local_datasource.dart';

class _DriftSectionsLocalReader {
  final AppDatabase _db;

  _DriftSectionsLocalReader(this._db);

  Future<List<SectionEntity>> getSections({
    required String tabId,
    required String locale,
    required int page,
    required int pageSize,
  }) async {
    final sections =
        await (_db.select(_db.cachedTabSections)
              ..where((s) => s.tabId.equals(tabId))
              ..orderBy([(s) => OrderingTerm.asc(s.sortOrder)]))
            .withPagination(page, pageSize)
            .get();

    return _getSectionsEntity(sections, locale);
  }

  Future<List<SectionEntity>> _getSectionsEntity(
    List<CachedTabSection> sections,
    String locale,
  ) => Future.value(
    sections.isEmpty
        ? const []
        : sections.map((s) => s.toEntity(locale)).toList(),
  );
}
