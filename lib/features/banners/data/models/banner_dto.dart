import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

typedef LocalizedString = Map<String, String>;

@Freezed(unionKey: 'type', toJson: false)
sealed class BannerDto with _$BannerDto {
  const BannerDto._();

  @FreezedUnionValue('event')
  const factory BannerDto.event({
    required String id,
    @Default('event') String type,
    required String imageAssetPath,
    required LocalizedString title,
    LocalizedString? topToolTipText,
    required LocalizedString description,
    String? eventId,
    String? eventCategory,
    LocalizedString? eventDescription,
  }) = EventBannerDto;

  @FreezedUnionValue('action')
  const factory BannerDto.action({
    required String id,
    @Default('action') String type,
    required String imageAssetPath,
    required LocalizedString title,
    LocalizedString? topToolTipText,
    required LocalizedString description,
    required String productId,
  }) = ActionBannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
