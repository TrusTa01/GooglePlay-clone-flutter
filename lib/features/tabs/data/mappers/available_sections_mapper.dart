import 'package:google_play/features/tabs/data/models/available_tabs_dto.dart';
import 'package:google_play/features/sections/domain/entities/available_tabs_entity.dart';

extension AvailableSectionsMapper on AvailableTabsDto {
  AvailableTabsEntity toEntity() {
    return AvailableTabsEntity(key: key, label: label, type: type);
  }
}
