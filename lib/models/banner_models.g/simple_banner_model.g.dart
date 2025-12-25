// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../banner_models/simple_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleBanner _$SimpleBannerFromJson(Map<String, dynamic> json) => SimpleBanner(
  id: json['id'] as String,
  imageAssetPath: json['imageAssetPath'] as String,
  title: json['title'] as String,
  hasTopToolTip: json['hasTopToolTip'] as bool,
  topToolTipText: json['topToolTip'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$SimpleBannerToJson(SimpleBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageAssetPath': instance.imageAssetPath,
      'title': instance.title,
      'hasTopToolTip': instance.hasTopToolTip,
      'topToolTip': instance.topToolTipText,
      'description': instance.description,
    };
