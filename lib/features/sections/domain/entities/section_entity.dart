import 'package:google_play/features/sections/domain/entities/data_params_entity.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';

class SectionEntity {
  final String id;
  final String tabKey;
  final SectionLayoutKind sectionType;
  final String? title;
  final String? subtitle;
  final SectionDataSource dataSource;
  final String? imageAssetPath;
  final int sortOrder;
  final String contentType;
  final DataParamsEntity? dataParamsEntity;

  const SectionEntity({
    required this.id,
    this.title,
    this.subtitle,
    required this.dataSource,
    this.imageAssetPath,
    this.dataParamsEntity,
    required this.tabKey,
    required this.sectionType,
    required this.sortOrder,
    required this.contentType,
  });
}
