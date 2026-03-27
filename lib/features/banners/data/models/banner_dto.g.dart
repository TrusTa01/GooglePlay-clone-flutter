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
      title: Map<String, String>.from(json['title'] as Map),
      topToolTipText: (json['topToolTipText'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      description: Map<String, String>.from(json['description'] as Map),
      eventId: json['eventId'] as String?,
      eventCategory: json['eventCategory'] as String?,
      eventDescription: (json['eventDescription'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );

ActionBannerDto _$ActionBannerDtoFromJson(Map<String, dynamic> json) =>
    ActionBannerDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'action',
      imageAssetPath: json['imageAssetPath'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      topToolTipText: (json['topToolTipText'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      description: Map<String, String>.from(json['description'] as Map),
      productId: json['productId'] as String,
    );
