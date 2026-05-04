// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_sections_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SectionsDto _$SectionsDtoFromJson(Map<String, dynamic> json) => _SectionsDto(
  id: json['id'] as String,
  tabId: json['tab_id'] as String,
  tabKey: json['tab_key'] as String,
  sectionType: json['section_title'] as String? ?? '',
  title: DtoJsonConverters.localizedStringNullableFromJson(json['title']),
  subtitle: DtoJsonConverters.localizedStringNullableFromJson(json['subtitle']),
  dataSource: json['data_source'] as String?,
  imageAssetPath: json['image_asset_path'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
  contentType: json['content_type'] as String? ?? '',
  dataParamsDto: json['data_params_dto'] == null
      ? null
      : ParamsDto.fromJson(json['data_params_dto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SectionsDtoToJson(_SectionsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tab_id': instance.tabId,
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

_ParamsDto _$ParamsDtoFromJson(Map<String, dynamic> json) => _ParamsDto(
  sort: json['sort'] as String?,
  extras: json['extras'] == null
      ? const ParamsExtrasDto(filters: [])
      : ParamsExtrasDto.fromJson(json['extras'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ParamsDtoToJson(_ParamsDto instance) =>
    <String, dynamic>{'sort': instance.sort, 'extras': instance.extras};

_ParamsExtrasDto _$ParamsExtrasDtoFromJson(Map<String, dynamic> json) =>
    _ParamsExtrasDto(
      filters:
          (json['filters'] as List<dynamic>?)
              ?.map((e) => ParamFilterDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ParamsExtrasDtoToJson(_ParamsExtrasDto instance) =>
    <String, dynamic>{'filters': instance.filters};

_ParamFilterDto _$ParamFilterDtoFromJson(Map<String, dynamic> json) =>
    _ParamFilterDto(type: json['type'] as String?, value: json['value']);

Map<String, dynamic> _$ParamFilterDtoToJson(_ParamFilterDto instance) =>
    <String, dynamic>{'type': instance.type, 'value': instance.value};
