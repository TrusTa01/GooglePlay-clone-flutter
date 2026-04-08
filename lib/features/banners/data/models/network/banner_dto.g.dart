// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBannerDto _$EventBannerDtoFromJson(Map<String, dynamic> json) =>
    EventBannerDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'event',
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
    );

ActionBannerDto _$ActionBannerDtoFromJson(Map<String, dynamic> json) =>
    ActionBannerDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'action',
      imageAssetPath: json['imageAssetPath'] as String,
      title: DtoJsonConverters.localizedStringFromJson(json['title']),
      topToolTipText: DtoJsonConverters.localizedStringNullableFromJson(
        json['topToolTipText'],
      ),
      description: DtoJsonConverters.localizedStringFromJson(
        json['description'],
      ),
      productId: json['productId'] as String,
    );
