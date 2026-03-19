import 'package:google_play/data/models/tabs_dtos/available_tabs_dto.dart';
import 'package:google_play/domain/entities/sections/available_tabs_entity.dart';

extension AvailableSectionsMapper on AvailableTabsDto {
  AvailableTabsEntity toEntity() {
    return AvailableTabsEntity(key: key, label: label, type: type);
  }
}
