class SectionEntity {
  final String id;
  final String type;
  final String? titleKey;
  final String? subtitleKey;
  final String? dataSource;
  final String? imageAssetPath;
  final DataParamsEntity? dataParamsEntity;

  const SectionEntity({
    required this.id,
    required this.type,
    this.titleKey,
    this.subtitleKey,
    this.dataSource,
    this.imageAssetPath,
    this.dataParamsEntity,
  });
}

class DataParamsEntity {
  final String? filterType;
  final dynamic filterValue;
  final Map<String, dynamic> extras;

  const DataParamsEntity({
    required this.filterType,
    required this.filterValue,
    this.extras = const {},
  });
}
