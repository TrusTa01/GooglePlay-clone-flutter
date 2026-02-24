// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleBannerDto _$SimpleBannerDtoFromJson(Map<String, dynamic> json) =>
    SimpleBannerDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'simple',
      imageAssetPath: json['imageAssetPath'] as String,
      title: json['title'] as String,
      topToolTipText: json['topToolTipText'] as String?,
      description: json['description'] as String,
      eventId: json['eventId'] as String?,
      eventCategory: json['eventCategory'] as String?,
      eventDescription: json['eventDescription'] as String?,
    );

ActionBannerDto _$ActionBannerDtoFromJson(Map<String, dynamic> json) =>
    ActionBannerDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'action',
      imageAssetPath: json['imageAssetPath'] as String,
      title: json['title'] as String,
      topToolTipText: json['topToolTipText'] as String?,
      description: json['description'] as String,
      productId: json['productId'] as String,
    );
