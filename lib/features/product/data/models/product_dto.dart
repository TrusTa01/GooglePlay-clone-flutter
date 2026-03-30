import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/features/product/data/models/product_dto_json_converters.dart';

export 'product_dto_json_converters.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class DeveloperDto with _$DeveloperDto {
  const factory DeveloperDto({
    required String id,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString city,
    required String phone,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString address,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString company,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString country,
    @JsonKey(name: 'website_url') required String websiteUrl,
    @JsonKey(name: 'email_support') required String emailSupport,
    @JsonKey(name: 'privacy_policy_url') required String privacyPolicyUrl,
  }) = _DeveloperDto;

  factory DeveloperDto.fromJson(Map<String, dynamic> json) =>
      _$DeveloperDtoFromJson(json);
}

@freezed
abstract class BookPublisherDto with _$BookPublisherDto {
  const factory BookPublisherDto({
    required String id,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString name,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
  }) = _BookPublisherDto;

  factory BookPublisherDto.fromJson(Map<String, dynamic> json) =>
      _$BookPublisherDtoFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class ProductDto with _$ProductDto {
  /// [Game]
  @FreezedUnionValue('game')
  const factory ProductDto.game({
    @Default('game') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    required double rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'icon_url') required String iconUrl,
    @JsonKey(name: 'is_paid') required bool isPaid,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency_code') @Default('USD') String currencyCode,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'technical_info') String? technicalInfo,
    @JsonKey(
      name: 'screenshots',
      fromJson: ProductDtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> screenshots,
    @JsonKey(
      name: 'supported_languages',
      fromJson: ProductDtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> supportedLanguages,
    @JsonKey(name: 'contains_ads') required bool containsAds,
    @JsonKey(name: 'contains_paid_content') required bool containsPaidContent,
    required String version,
    required String size,
    @JsonKey(
      name: 'event_text',
      fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson,
    )
    LocalizedString? eventText,
    @JsonKey(
      name: 'whats_new_text',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString whatsNewText,
    @JsonKey(name: 'download_count') required int downloadCount,
    @JsonKey(name: 'age_rating') required int ageRating,
    @JsonKey(name: 'is_kids_friendly') required bool isKidsFriendly,
    @JsonKey(
      name: 'age_rating_reasons',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> ageRatingReasons,
    @JsonKey(
      name: 'permissions',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> permissions,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
    @JsonKey(
      name: 'creator_description',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    @Default(<String, String>{})
    LocalizedString creatorDescription,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'has_multiplayer') bool? hasMultiplayer,
    @JsonKey(name: 'game_modes') String? gameModes,
    @JsonKey(name: 'has_controller_support') bool? hasControllerSupport,
    @JsonKey(
      name: 'achievements',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    @Default(<LocalizedString>[])
    List<LocalizedString> achievements,
    @JsonKey(name: 'developer') required DeveloperDto developer,
    @JsonKey(
      name: 'categories',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> categories,
    @JsonKey(
      name: 'tags',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> tags,
  }) = GameDto;

  /// [App]
  @FreezedUnionValue('app')
  const factory ProductDto.app({
    @Default('app') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    required double rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'icon_url') required String iconUrl,
    @JsonKey(name: 'is_paid') required bool isPaid,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency_code') @Default('USD') String currencyCode,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'url') required String url,
    @JsonKey(
      name: 'screenshots',
      fromJson: ProductDtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> screenshots,
    @JsonKey(
      name: 'supported_languages',
      fromJson: ProductDtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> supportedLanguages,
    @JsonKey(name: 'contains_ads') required bool containsAds,
    @JsonKey(name: 'contains_paid_content') required bool containsPaidContent,
    required String version,
    required String size,
    @JsonKey(
      name: 'event_text',
      fromJson: ProductDtoJsonConverters.localizedStringNullableFromJson,
    )
    LocalizedString? eventText,
    @JsonKey(
      name: 'whats_new_text',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString whatsNewText,
    @JsonKey(name: 'download_count') required int downloadCount,
    @JsonKey(name: 'age_rating') required int ageRating,
    @JsonKey(name: 'is_kids_friendly') required bool isKidsFriendly,
    @JsonKey(
      name: 'age_rating_reasons',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> ageRatingReasons,
    @JsonKey(
      name: 'permissions',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> permissions,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
    @JsonKey(
      name: 'creator_description',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    @Default(<String, String>{})
    LocalizedString creatorDescription,
    @JsonKey(name: 'package_name') required String packageName,
    @JsonKey(name: 'developer') required DeveloperDto developer,
    @JsonKey(
      name: 'categories',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> categories,
    @JsonKey(
      name: 'tags',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> tags,
  }) = AppDto;

  /// [Book]
  @FreezedUnionValue('book')
  const factory ProductDto.book({
    @Default('book') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: ProductDtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: ProductDtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    required double rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'icon_url') required String iconUrl,
    @JsonKey(name: 'is_paid') required bool isPaid,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency_code') @Default('USD') String currencyCode,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'publisher') required BookPublisherDto publisher,
    @JsonKey(
      name: 'categories',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> categories,
    @JsonKey(
      name: 'tags',
      fromJson: ProductDtoJsonConverters.localizedStringListFromJson,
    )
    required List<LocalizedString> tags,
    @JsonKey(name: 'page_count') required int pageCount,
    required String language,
    required String format,
    @JsonKey(name: 'has_audio_version') required bool hasAudioVersion,
    @JsonKey(name: 'audio_duration') int? audioDuration,
    String? narrator,
    @JsonKey(name: 'is_series') required bool isSeries,
    @JsonKey(name: 'series_name') String? seriesName,
    @JsonKey(name: 'series_number') int? seriesNumber,
    @JsonKey(name: 'sample_available') required bool sampleAvailable,
    @JsonKey(name: 'is_abridged') required bool isAbridged,
    @JsonKey(name: 'publication_date') required DateTime publicationDate,
    @JsonKey(
      name: 'awards',
      fromJson: ProductDtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> awards,
  }) = BookDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
