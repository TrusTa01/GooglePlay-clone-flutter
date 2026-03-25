import 'package:google_play/features/sections/data/mappers/section_mapper.dart';
import 'package:google_play/features/sections/data/models/section_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';

extension TabConfigMapper on TabConfigDto {
  TabConfigEntity toEntity() {
    return StandartTabEntity(
      tabKey: tabKey,
      displayName: displayName,
      sections: sections.map((dto) => dto.toEntity()).toList(),
    );
  }
}
