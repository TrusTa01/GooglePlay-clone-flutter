import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';

extension DataParamsMapper on DataParamsDto {
  DataParamsEntity toEntity() {
    return DataParamsEntity(
      filterType: filterType,
      filterValue: filterValue,
      extras: extras,
    );
  }
}
