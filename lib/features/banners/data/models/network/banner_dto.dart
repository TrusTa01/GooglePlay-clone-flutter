import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@Freezed(unionKey: 'type', toJson: false)
sealed class BannerDto with _$BannerDto {
  const BannerDto._();

  @FreezedUnionValue('event')
  const factory BannerDto.event({
    required String id,
    @Default('event') String type,
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
  }) = EventBannerDto;

  @FreezedUnionValue('action')
  const factory BannerDto.action({
    required String id,
    @Default('action') String type,
    required String imageAssetPath,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringNullableFromJson)
    LocalizedString? topToolTipText,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    required String productId,
  }) = ActionBannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
