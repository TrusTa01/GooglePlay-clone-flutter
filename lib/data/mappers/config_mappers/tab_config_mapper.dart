import 'package:google_play/data/mappers/config_mappers/section_mapper.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/sections/section_entity.dart';

extension TabConfigMapper on TabConfigDto {
  TabConfigEntity toEntity() {
    return StandartTabEntity(
      tabKey: tabKey,
      displayName: displayName,
      sections: sections.map((dto) => dto.toEntity()).toList(),
    );
  }
}
