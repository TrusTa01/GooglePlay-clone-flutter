// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_sections_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TabSectionsDto _$TabSectionsDtoFromJson(Map<String, dynamic> json) =>
    _TabSectionsDto(
      tabId: json['tabId'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabSectionsDtoToJson(_TabSectionsDto instance) =>
    <String, dynamic>{'tabId': instance.tabId, 'sections': instance.sections};

_SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) => _SectionDto(
  id: json['id'] as String,
  tabKey: json['tab_key'] as String,
  sectionType: json['section_title'] as String,
  title: DtoJsonConverters.localizedStringNullableFromJson(json['title']),
  subtitle: DtoJsonConverters.localizedStringNullableFromJson(json['subtitle']),
  dataSource: json['data_source'] as String?,
  imageAssetPath: json['image_asset_path'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
  contentType: json['content_type'] as String,
  dataParamsDto: json['data_params_dto'] == null
      ? null
      : DataParamsDto.fromJson(json['data_params_dto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SectionDtoToJson(_SectionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tab_key': instance.tabKey,
      'section_title': instance.sectionType,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'data_source': instance.dataSource,
      'image_asset_path': instance.imageAssetPath,
      'sort_order': instance.sortOrder,
      'content_type': instance.contentType,
      'data_params_dto': instance.dataParamsDto,
    };

_DataParamsDto _$DataParamsDtoFromJson(Map<String, dynamic> json) =>
    _DataParamsDto(
      sort: json['sort'] as String?,
      extras: json['extras'] == null
          ? const DataParamsExtrasDto(filters: [])
          : DataParamsExtrasDto.fromJson(
              json['extras'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DataParamsDtoToJson(_DataParamsDto instance) =>
    <String, dynamic>{'sort': instance.sort, 'extras': instance.extras};

_DataParamsExtrasDto _$DataParamsExtrasDtoFromJson(Map<String, dynamic> json) =>
    _DataParamsExtrasDto(
      filters:
          (json['filters'] as List<dynamic>?)
              ?.map((e) => ParamFilterDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DataParamsExtrasDtoToJson(
  _DataParamsExtrasDto instance,
) => <String, dynamic>{'filters': instance.filters};

_ParamFilterDto _$ParamFilterDtoFromJson(Map<String, dynamic> json) =>
    _ParamFilterDto(type: json['type'] as String?, value: json['value']);

Map<String, dynamic> _$ParamFilterDtoToJson(_ParamFilterDto instance) =>
    <String, dynamic>{'type': instance.type, 'value': instance.value};
