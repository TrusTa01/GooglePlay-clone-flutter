// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../section_models/section_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionConfig _$SectionConfigFromJson(Map<String, dynamic> json) =>
    SectionConfig(
      type: $enumDecode(_$SectionConfigTypeEnumMap, json['type']),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      imageAssetPath: json['imageAssetPath'] as String?,
      showButton: json['showButton'] as bool? ?? true,
      needsTopPadding: json['needsTopPadding'] as bool? ?? true,
      dataMethod: json['dataMethod'] as String?,
      dataParams: json['dataParams'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SectionConfigToJson(SectionConfig instance) =>
    <String, dynamic>{
      'type': _$SectionConfigTypeEnumMap[instance.type]!,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageAssetPath': instance.imageAssetPath,
      'showButton': instance.showButton,
      'needsTopPadding': instance.needsTopPadding,
      'dataMethod': instance.dataMethod,
      'dataParams': instance.dataParams,
    };

const _$SectionConfigTypeEnumMap = {
  SectionConfigType.carousel: 'carousel',
  SectionConfigType.grid: 'grid',
  SectionConfigType.banners: 'banners',
  SectionConfigType.preview: 'preview',
  SectionConfigType.kidsHeroBanner: 'kidsHeroBanner',
  SectionConfigType.ageFilterSelector: 'ageFilterSelector',
};

PageConfig _$PageConfigFromJson(Map<String, dynamic> json) => PageConfig(
  id: json['id'] as String,
  sections: (json['sections'] as List<dynamic>)
      .map((e) => SectionConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PageConfigToJson(PageConfig instance) =>
    <String, dynamic>{'id': instance.id, 'sections': instance.sections};
