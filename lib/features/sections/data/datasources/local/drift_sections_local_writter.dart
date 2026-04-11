part of 'drift_sections_local_datasource.dart';

class _DriftSectionsLocalWritter extends BaseDriftWriter<SectionsDto> {
  const _DriftSectionsLocalWritter(super.db);

  @override
  Future<void> upsertOne(SectionsDto dto) async {
    final paramsJson = _encodeDataParams(dto.dataParamsDto);
    final row = CachedTabSectionsCompanion.insert(
      id: dto.id,
      tabId: dto.tabId,
      sectionType: dto.sectionType,
      title: Value(dto.title),
      subtitle: Value(dto.subtitle),
      dataSource: dto.dataSource ?? '',
      params: Value(paramsJson),
      imageAssetPath: Value(dto.imageAssetPath),
      sortOrder: Value(dto.sortOrder),
      contentType: dto.contentType,
      tabKey: dto.tabKey,
      sectionKey: dto.id,
    );

    await db.batch((batch) {
      batch.insertAllOnConflictUpdate(db.cachedTabSections, [row]);
    });
  }

  String? _encodeDataParams(ParamsDto? params) =>
      params == null ? null : jsonEncode(params.toJson());
}
