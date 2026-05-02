import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/sections/domain/entities/params_entity.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';

extension DataParamsMapper on ParamsDto {
  ParamsEntity toEntity() {
    final entity = ParamsEntity(sort: sort, extras: extras.toEntity());
    FeatureTalker.mapperOut(
      'sections.params_mapper',
      'ParamsDto -> ParamsEntity',
      context: {'sort': sort},
    );
    return entity;
  }
}

extension DataParamsExtrasMapper on ParamsExtrasDto {
  ParamsExtrasEntity toEntity() {
    final entity = ParamsExtrasEntity(
      filters: filters.map((f) => f.toEntity()).toList(),
    );
    FeatureTalker.mapperOut(
      'sections.params_mapper',
      'ParamsExtrasDto -> ParamsExtrasEntity',
      context: {'filters': entity.filters},
    );
    return entity;
  }
}

extension ParamFilterMapper on ParamFilterDto {
  ParamFilterEntity toEntity() {
    final entity = ParamFilterEntity(type: type, value: value);
    FeatureTalker.mapperOut(
      'sections.params_mapper',
      'ParamFilterDto -> ParamFilterEntity',
      context: {'type': type, 'value': value},
    );
    return entity;
  }
}
