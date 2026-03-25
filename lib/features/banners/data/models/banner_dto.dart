import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@Freezed(unionKey: 'type', toJson: false)
sealed class BannerDto with _$BannerDto {
  const BannerDto._();

  @FreezedUnionValue('simple')
  const factory BannerDto.simple({
    required String id,
    @Default('simple') String type,
    required String imageAssetPath,
    required String title,
    String? topToolTipText,
    required String description,
    String? eventId,
    String? eventCategory,
    String? eventDescription,
  }) = SimpleBannerDto;

  @FreezedUnionValue('action')
  const factory BannerDto.action({
    required String id,
    @Default('action') String type,
    required String imageAssetPath,
    required String title,
    String? topToolTipText,
    required String description,
    required String productId,
  }) = ActionBannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
