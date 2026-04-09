import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind.dart';

class SectionEntity {
  final String id;
  final SectionLayoutKind layout;
  final Map<String, String>? title;
  final Map<String, String>? subtitle;
  final SectionDataSource? dataSource;
  final String? imageAssetPath;
  final DataParamsEntity? dataParamsEntity;

  const SectionEntity({
    required this.id,
    required this.layout,
    this.title,
    this.subtitle,
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
