// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TabConfigDto _$TabConfigDtoFromJson(Map<String, dynamic> json) =>
    _TabConfigDto(
      tabKey: json['tab_key'] as String,
      displayName: json['display_name'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabConfigDtoToJson(_TabConfigDto instance) =>
    <String, dynamic>{
      'tab_key': instance.tabKey,
      'display_name': instance.displayName,
      'sections': instance.sections,
    };

_SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) => _SectionDto(
  id: json['id'] as String,
  type: json['type'] as String,
  titleKey: json['title_key'] as String?,
  subtitleKey: json['subtitle_key'] as String?,
  dataSource: json['data_source'] as String?,
  imageAssetPath: json['imagea_asset_path'] as String,
  dataParamsDto: json['data_params_dto'] == null
      ? null
      : DataParamsDto.fromJson(json['data_params_dto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SectionDtoToJson(_SectionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title_key': instance.titleKey,
      'subtitle_key': instance.subtitleKey,
      'data_source': instance.dataSource,
      'imagea_asset_path': instance.imageAssetPath,
      'data_params_dto': instance.dataParamsDto,
    };

_DataParamsDto _$DataParamsDtoFromJson(Map<String, dynamic> json) =>
    _DataParamsDto(
      filterType: json['filter_type'] as String?,
      filterValue: json['title_value'],
      extras: json['extras'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$DataParamsDtoToJson(_DataParamsDto instance) =>
    <String, dynamic>{
      'filter_type': instance.filterType,
      'title_value': instance.filterValue,
      'extras': instance.extras,
    };
