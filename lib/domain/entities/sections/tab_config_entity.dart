import 'package:google_play/domain/entities/sections/section_data_source.dart';
import 'package:google_play/domain/entities/sections/section_layout_kind.dart';

class SectionEntity {
  final String id;
  final SectionLayoutKind layout;
  final String? titleKey;
  final String? subtitleKey;
  final SectionDataSource? dataSource;
  final String? imageAssetPath;
  final DataParamsEntity? dataParamsEntity;

  const SectionEntity({
    required this.id,
    required this.layout,
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
