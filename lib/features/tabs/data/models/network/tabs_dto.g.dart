// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TabsDto _$TabsDtoFromJson(Map<String, dynamic> json) => _TabsDto(
  id: json['id'] as String,
  contentType: json['content_type'] as String,
  tabKey: json['tab_key'] as String,
  label: DtoJsonConverters.localizedStringFromJson(json['label']),
  tabType: json['tab_type'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
);

Map<String, dynamic> _$TabsDtoToJson(_TabsDto instance) => <String, dynamic>{
  'id': instance.id,
  'content_type': instance.contentType,
  'tab_key': instance.tabKey,
  'label': instance.label,
  'tab_type': instance.tabType,
  'sort_order': instance.sortOrder,
};
