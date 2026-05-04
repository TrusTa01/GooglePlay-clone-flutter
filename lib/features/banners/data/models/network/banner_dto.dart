import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@Freezed(unionKey: 'type', toJson: false)
sealed class BannerDto with _$BannerDto {
  const BannerDto._();

  @FreezedUnionValue('event')
  const factory BannerDto.event({
    @Default('event') String type,
    required String id,
    @JsonKey(name: 'image_asset_path') @Default('') String imageAssetPath,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? topToolTipText,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString description,
    @JsonKey(name: 'event_id') String? eventId,
    @JsonKey(name: 'event_category') String? eventCategory,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    @JsonKey(name: 'event_description')
    LocalizedString? eventDescription,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = EventBannerDto;

  @FreezedUnionValue('action')
  const factory BannerDto.action({
    @Default('action') String type,
    required String id,
    @JsonKey(name: 'product_external_id') @Default('') String productExternalId,
    @JsonKey(name: 'image_asset_path') @Default('') String imageAssetPath,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? topToolTipText,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = ActionBannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
