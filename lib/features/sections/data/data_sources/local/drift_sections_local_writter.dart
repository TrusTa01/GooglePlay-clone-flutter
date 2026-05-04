part of 'drift_sections_local_data_source.dart';

class _DriftSectionsLocalWritter extends BaseDriftWriter<SectionsDto> {
  const _DriftSectionsLocalWritter(super.db);

  @override
  Future<void> upsertOne(SectionsDto dto) {
    final paramsJson = _encodeDataParams(dto.dataParamsDto);
    final row = CachedSectionsCompanion.insert(
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

    return db.into(db.cachedSections).insertOnConflictUpdate(row);
  }

  String? _encodeDataParams(ParamsDto? params) =>
      params == null ? null : jsonEncode(params.toJson());
}
