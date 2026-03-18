import 'package:google_play/data/models/section_dtos/available_sections_dto.dart';
import 'package:google_play/domain/entities/sections/available_sections_entity.dart';

extension AvailableSectionsMapper on AvailableSectionsDto {
  AvailableSectionsEntity toEntity() {
    return AvailableSectionsEntity(key: key, label: label, type: type);
  }
}
