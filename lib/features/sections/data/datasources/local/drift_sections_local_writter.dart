part of 'drift_sections_local_datasource.dart';

class _DriftSectionsLocalWritter extends BaseDriftWriter<TabSectionsDto> {
  const _DriftSectionsLocalWritter(super.db);

  @override
  Future<void> upsertOne(TabSectionsDto dto) async {
    final tabId = dto.tabId;
    final rows = <CachedTabSectionsCompanion>[];
    for (final section in dto.sections) {
      final paramsJson = _encodeDataParams(section.dataParamsDto);
      rows.add(
        CachedTabSectionsCompanion.insert(
          id: section.id,
          tabId: tabId,
          sectionType: section.sectionType,
          title: Value(section.title),
          subtitle: Value(section.subtitle),
          dataSource: section.dataSource,
          params: Value(paramsJson),
          imageAssetPath: Value(section.imageAssetPath),
          sortOrder: Value(section.sortOrder),
          contentType: section.contentType,
          tabKey: section.tabKey,
          sectionKey: section.id,
        ),
      );
    }
    if (rows.isEmpty) return;
    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.cachedTabSections, rows);
    });
  }

  String? _encodeDataParams(DataParamsDto? params) {
    if (params == null) return null;
    return jsonEncode(params.toJson());
  }
}
