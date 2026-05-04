// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventBannerDto _$EventBannerDtoFromJson(Map<String, dynamic> json) =>
    EventBannerDto(
      type: json['type'] as String? ?? 'event',
      id: json['id'] as String,
      imageAssetPath: json['image_asset_path'] as String? ?? '',
      title: json['title'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['title']),
      topToolTipText: DtoJsonConverters.localizedStringNullableFromJson(
        json['topToolTipText'],
      ),
      description: json['description'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['description']),
      eventId: json['event_id'] as String?,
      eventCategory: json['event_category'] as String?,
      eventDescription: DtoJsonConverters.localizedStringNullableFromJson(
        json['eventDescription'],
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

ActionBannerDto _$ActionBannerDtoFromJson(Map<String, dynamic> json) =>
    ActionBannerDto(
      type: json['type'] as String? ?? 'action',
      id: json['id'] as String,
      productExternalId: json['product_external_id'] as String? ?? '',
      imageAssetPath: json['image_asset_path'] as String? ?? '',
      title: json['title'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['title']),
      topToolTipText: DtoJsonConverters.localizedStringNullableFromJson(
        json['topToolTipText'],
      ),
      description: json['description'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['description']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
