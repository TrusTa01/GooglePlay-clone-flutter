import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

extension DataParamsMapper on ParamsDto {
  ParamsEntity toEntity() => ParamsEntity(
    sort: sort,
    extras: extras.toEntity(),
  );
}

extension DataParamsExtrasMapper on ParamsExtrasDto {
  ParamsExtrasEntity toEntity() => ParamsExtrasEntity(
    filters: filters.map((f) => f.toEntity()).toList(),
  );
}

extension ParamFilterMapper on ParamFilterDto {
  ParamFilterEntity toEntity() => ParamFilterEntity(type: type, value: value);
}
