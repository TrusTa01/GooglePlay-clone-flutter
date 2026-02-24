// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TabConfigDto _$TabConfigDtoFromJson(Map<String, dynamic> json) =>
    _TabConfigDto(
      tabKey: json['tabKey'] as String,
      displayName: json['displayName'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabConfigDtoToJson(_TabConfigDto instance) =>
    <String, dynamic>{
      'tabKey': instance.tabKey,
      'displayName': instance.displayName,
      'sections': instance.sections,
    };

_SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) => _SectionDto(
  id: json['id'] as String,
  type: json['type'] as String,
  titleKey: json['titleKey'] as String?,
  subtitleKey: json['subtitleKey'] as String?,
  dataSource: json['dataSource'] as String?,
  imageAssetPath: json['imageAssetPath'] as String,
  dataParamsDto: json['dataParamsDto'] == null
      ? null
      : DataParamsDto.fromJson(json['dataParamsDto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SectionDtoToJson(_SectionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'titleKey': instance.titleKey,
      'subtitleKey': instance.subtitleKey,
      'dataSource': instance.dataSource,
      'imageAssetPath': instance.imageAssetPath,
      'dataParamsDto': instance.dataParamsDto,
    };

_DataParamsDto _$DataParamsDtoFromJson(Map<String, dynamic> json) =>
    _DataParamsDto(
      filterType: json['filterType'] as String?,
      filterValue: json['filterValue'],
      extras: json['extras'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$DataParamsDtoToJson(_DataParamsDto instance) =>
    <String, dynamic>{
      'filterType': instance.filterType,
      'filterValue': instance.filterValue,
      'extras': instance.extras,
    };
