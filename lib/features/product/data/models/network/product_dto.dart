import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/core/data/json/dto_json_converters.dart';

export 'package:google_play/core/data/json/dto_json_converters.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class DeveloperDto with _$DeveloperDto {
  const factory DeveloperDto({
    @Default('') String id,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString city,
    @Default('') String phone,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString address,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString company,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString country,
    @JsonKey(name: 'website_url') @Default('') String websiteUrl,
    @JsonKey(name: 'email_support') @Default('') String emailSupport,
    @JsonKey(name: 'privacy_policy_url') @Default('') String privacyPolicyUrl,
  }) = _DeveloperDto;

  factory DeveloperDto.fromJson(Map<String, dynamic> json) =>
      _$DeveloperDtoFromJson(json);
}

@freezed
abstract class BookPublisherDto with _$BookPublisherDto {
  const factory BookPublisherDto({
    @Default('') String id,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString name,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString description,
  }) = _BookPublisherDto;

  factory BookPublisherDto.fromJson(Map<String, dynamic> json) =>
      _$BookPublisherDtoFromJson(json);
}

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @Default('') String id,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString name,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}

@freezed
abstract class TagDto with _$TagDto {
  const factory TagDto({
    @Default('') String id,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    @Default(<String, String>{})
    LocalizedString name,
  }) = _TagDto;

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class ProductDto with _$ProductDto {
  /// [Game]
  @FreezedUnionValue('game')
  const factory ProductDto.game({
    @Default('game') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    double? rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'rating_avg') @Default(0) double ratingAvg,
    @JsonKey(
      name: 'rating_distribution',
      fromJson: DtoJsonConverters.ratingDistributionFromJson,
    )
    @Default(<String, int>{})
    Map<String, int> ratingDistribution,
    @JsonKey(
      name: 'top_reviews',
      fromJson: DtoJsonConverters.topReviewsFromJson,
    )
    @Default(<Map<String, dynamic>>[])
    List<Map<String, dynamic>> topReviews,
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
      fromJson: DtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> screenshots,
    @JsonKey(
      name: 'supported_languages',
      fromJson: DtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> supportedLanguages,
    @JsonKey(name: 'contains_ads') bool? containsAds,
    @JsonKey(name: 'contains_paid_content') bool? containsPaidContent,
    String? version,
    String? size,
    @JsonKey(
      name: 'event_text',
      fromJson: DtoJsonConverters.localizedStringNullableFromJson,
    )
    LocalizedString? eventText,
    @JsonKey(
      name: 'whats_new_text',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    LocalizedString? whatsNewText,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'age_rating') int? ageRating,
    @JsonKey(name: 'is_kids_friendly') bool? isKidsFriendly,
    @JsonKey(
      name: 'age_rating_reasons',
      fromJson: DtoJsonConverters.localizedStringListFromJson,
    )
    List<LocalizedString>? ageRatingReasons,
    @JsonKey(
      name: 'permissions',
      fromJson: DtoJsonConverters.localizedStringListFromJson,
    )
    List<LocalizedString>? permissions,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    @JsonKey(
      name: 'creator_description',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    @Default(<String, String>{})
    LocalizedString creatorDescription,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'has_multiplayer') bool? hasMultiplayer,
    @JsonKey(name: 'game_modes') String? gameModes,
    @JsonKey(name: 'has_controller_support') bool? hasControllerSupport,
    @JsonKey(
      name: 'achievements',
      fromJson: DtoJsonConverters.localizedStringListFromJson,
    )
    @Default(<LocalizedString>[])
    List<LocalizedString> achievements,
    @JsonKey(name: 'developer') DeveloperDto? developer,
    @JsonKey(name: 'categories') required List<CategoryDto> categories,
    @JsonKey(name: 'tags') required List<TagDto> tags,
  }) = GameDto;

  /// [App]
  @FreezedUnionValue('app')
  const factory ProductDto.app({
    @Default('app') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    double? rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'rating_avg') @Default(0) double ratingAvg,
    @JsonKey(
      name: 'rating_distribution',
      fromJson: DtoJsonConverters.ratingDistributionFromJson,
    )
    @Default(<String, int>{})
    Map<String, int> ratingDistribution,
    @JsonKey(
      name: 'top_reviews',
      fromJson: DtoJsonConverters.topReviewsFromJson,
    )
    @Default(<Map<String, dynamic>>[])
    List<Map<String, dynamic>> topReviews,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'icon_url') required String iconUrl,
    @JsonKey(name: 'is_paid') required bool isPaid,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency_code') @Default('USD') String currencyCode,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'url') required String url,
    @JsonKey(
      name: 'screenshots',
      fromJson: DtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> screenshots,
    @JsonKey(
      name: 'supported_languages',
      fromJson: DtoJsonConverters.stringListFromJson,
    )
    @Default(<String>[])
    List<String> supportedLanguages,
    @JsonKey(name: 'contains_ads') bool? containsAds,
    @JsonKey(name: 'contains_paid_content') bool? containsPaidContent,
    String? version,
    String? size,
    @JsonKey(
      name: 'event_text',
      fromJson: DtoJsonConverters.localizedStringNullableFromJson,
    )
    LocalizedString? eventText,
    @JsonKey(
      name: 'whats_new_text',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    LocalizedString? whatsNewText,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'age_rating') int? ageRating,
    @JsonKey(name: 'is_kids_friendly') bool? isKidsFriendly,
    @JsonKey(
      name: 'age_rating_reasons',
      fromJson: DtoJsonConverters.localizedStringListFromJson,
    )
    List<LocalizedString>? ageRatingReasons,
    @JsonKey(
      name: 'permissions',
      fromJson: DtoJsonConverters.localizedStringListFromJson,
    )
    List<LocalizedString>? permissions,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    @JsonKey(
      name: 'creator_description',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    @Default(<String, String>{})
    LocalizedString creatorDescription,
    @JsonKey(name: 'package_name') required String packageName,
    @JsonKey(name: 'developer') DeveloperDto? developer,
    @JsonKey(name: 'categories') required List<CategoryDto> categories,
    @JsonKey(name: 'tags') required List<TagDto> tags,
  }) = AppDto;

  /// [Book]
  @FreezedUnionValue('book')
  const factory ProductDto.book({
    @Default('book') String type,
    required String id,
    @JsonKey(name: 'external_id') required String externalId,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString title,
    @JsonKey(
      name: 'short_description',
      fromJson: DtoJsonConverters.localizedStringFromJson,
    )
    required LocalizedString shortDescription,
    @JsonKey(fromJson: DtoJsonConverters.localizedStringFromJson)
    required LocalizedString description,
    double? rating,
    @JsonKey(name: 'reviews_count') required int reviewsCount,
    @JsonKey(name: 'rating_avg') @Default(0) double ratingAvg,
    @JsonKey(
      name: 'rating_distribution',
      fromJson: DtoJsonConverters.ratingDistributionFromJson,
    )
    @Default(<String, int>{})
    Map<String, int> ratingDistribution,
    @JsonKey(
      name: 'top_reviews',
      fromJson: DtoJsonConverters.topReviewsFromJson,
    )
    @Default(<Map<String, dynamic>>[])
    List<Map<String, dynamic>> topReviews,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'icon_url') required String iconUrl,
    @JsonKey(name: 'is_paid') required bool isPaid,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency_code') @Default('USD') String currencyCode,
    @JsonKey(name: 'discount_price') double? discountPrice,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'publisher') required BookPublisherDto publisher,
    @JsonKey(name: 'categories') required List<CategoryDto> categories,
    @JsonKey(name: 'tags') required List<TagDto> tags,
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
    @JsonKey(name: 'awards', fromJson: DtoJsonConverters.stringListFromJson)
    @Default(<String>[])
    List<String> awards,
  }) = BookDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
