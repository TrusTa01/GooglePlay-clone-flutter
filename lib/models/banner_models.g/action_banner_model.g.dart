// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../banner_models/action_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionBanner _$ActionBannerFromJson(Map<String, dynamic> json) => ActionBanner(
  id: json['id'] as String,
  imageAssetPath: json['imageAssetPath'] as String,
  title: json['title'] as String,
  hasTopToolTip: json['hasTopToolTip'] as bool,
  topToolTipText: json['topToolTipText'] as String?,
  description: json['description'] as String?,
  productId: json['productId'] as String,
);

Map<String, dynamic> _$ActionBannerToJson(ActionBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageAssetPath': instance.imageAssetPath,
      'title': instance.title,
      'hasTopToolTip': instance.hasTopToolTip,
      'topToolTipText': instance.topToolTipText,
      'description': instance.description,
      'productId': instance.productId,
    };
