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
    required String imageAssetPath,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? topToolTipText,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    String? eventId,
    String? eventCategory,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? eventDescription,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = EventBannerDto;

  @FreezedUnionValue('action')
  const factory BannerDto.action({
    @Default('action') String type,
    required String id,
    required String productExternalId,
    required String imageAssetPath,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? topToolTipText,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = ActionBannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
