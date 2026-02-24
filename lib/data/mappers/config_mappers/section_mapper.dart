import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';

extension SectionMapper on SectionDto {
  SectionEntity toEntity() {
    return SectionEntity(
      id: id,
      type: type,
      titleKey: titleKey,
      subtitleKey: subtitleKey,
      dataSource: dataSource,
      imageAssetPath: imageAssetPath,
    );
  }
}
