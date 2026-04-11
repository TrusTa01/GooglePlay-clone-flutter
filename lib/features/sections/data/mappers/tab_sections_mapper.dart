import 'package:google_play/features/sections/data/mappers/section_mapper.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/tab_sections_entity.dart';

extension TabSectionsMapper on TabSectionsDto {
  TabSectionsEntity toEntity(String locale) => StandartTabEntity(
    tabId: tabId,
    sections: sections.map((dto) => dto.toEntity(locale)).toList(),
  );
}
