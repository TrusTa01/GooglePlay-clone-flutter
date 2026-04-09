// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBannerDto _$EventBannerDtoFromJson(Map<String, dynamic> json) =>
    EventBannerDto(
      type: json['type'] as String? ?? 'event',
      id: json['id'] as String,
      imageAssetPath: json['imageAssetPath'] as String,
      title: DtoJsonConverters.localizedStringFromJson(json['title']),
      topToolTipText: DtoJsonConverters.localizedStringNullableFromJson(
        json['topToolTipText'],
      ),
      description: DtoJsonConverters.localizedStringFromJson(
        json['description'],
      ),
      eventId: json['eventId'] as String?,
      eventCategory: json['eventCategory'] as String?,
      eventDescription: DtoJsonConverters.localizedStringNullableFromJson(
        json['eventDescription'],
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

ActionBannerDto _$ActionBannerDtoFromJson(Map<String, dynamic> json) =>
    ActionBannerDto(
      type: json['type'] as String? ?? 'action',
      id: json['id'] as String,
      productExternalId: json['productExternalId'] as String,
      imageAssetPath: json['imageAssetPath'] as String,
      title: DtoJsonConverters.localizedStringFromJson(json['title']),
      topToolTipText: DtoJsonConverters.localizedStringNullableFromJson(
        json['topToolTipText'],
      ),
      description: DtoJsonConverters.localizedStringFromJson(
        json['description'],
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
