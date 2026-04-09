import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/data/models/section_dto.dart';

extension DataParamsMapper on DataParamsDto {
  DataParamsEntity toEntity() {
    return DataParamsEntity(
      filterType: filterType,
      filterValue: filterValue,
      extras: extras,
    );
  }
}
