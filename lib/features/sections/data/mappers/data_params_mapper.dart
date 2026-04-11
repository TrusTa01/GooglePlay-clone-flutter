import 'package:google_play/features/sections/domain/entities/data_params_entity.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

extension DataParamsMapper on DataParamsDto {
  DataParamsEntity toEntity() => DataParamsEntity(
    sort: sort,
    extras: extras.toEntity(),
  );
}

extension DataParamsExtrasMapper on DataParamsExtrasDto {
  DataParamsExtrasEntity toEntity() => DataParamsExtrasEntity(
    filters: filters.map((f) => f.toEntity()).toList(),
  );
}

extension ParamFilterMapper on ParamFilterDto {
  ParamFilterEntity toEntity() => ParamFilterEntity(type: type, value: value);
}
