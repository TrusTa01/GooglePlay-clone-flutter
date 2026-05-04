// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeveloperDto _$DeveloperDtoFromJson(Map<String, dynamic> json) =>
    _DeveloperDto(
      id: json['id'] as String? ?? '',
      city: json['city'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['city']),
      phone: json['phone'] as String? ?? '',
      address: json['address'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['address']),
      company: json['company'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['company']),
      country: json['country'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['country']),
      websiteUrl: json['website_url'] as String? ?? '',
      emailSupport: json['email_support'] as String? ?? '',
      privacyPolicyUrl: json['privacy_policy_url'] as String? ?? '',
    );

Map<String, dynamic> _$DeveloperDtoToJson(_DeveloperDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'phone': instance.phone,
      'address': instance.address,
      'company': instance.company,
      'country': instance.country,
      'website_url': instance.websiteUrl,
      'email_support': instance.emailSupport,
      'privacy_policy_url': instance.privacyPolicyUrl,
    };

_BookPublisherDto _$BookPublisherDtoFromJson(Map<String, dynamic> json) =>
    _BookPublisherDto(
      id: json['id'] as String? ?? '',
      name: json['name'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['name']),
      description: json['description'] == null
          ? const <String, String>{}
          : DtoJsonConverters.localizedStringFromJson(json['description']),
    );

Map<String, dynamic> _$BookPublisherDtoToJson(_BookPublisherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
  id: json['id'] as String? ?? '',
  name: json['name'] == null
      ? const <String, String>{}
      : DtoJsonConverters.localizedStringFromJson(json['name']),
);

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_TagDto _$TagDtoFromJson(Map<String, dynamic> json) => _TagDto(
  id: json['id'] as String? ?? '',
  name: json['name'] == null
      ? const <String, String>{}
      : DtoJsonConverters.localizedStringFromJson(json['name']),
);

Map<String, dynamic> _$TagDtoToJson(_TagDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

GameDto _$GameDtoFromJson(Map<String, dynamic> json) => GameDto(
  type: json['type'] as String? ?? 'game',
  id: json['id'] as String,
  externalId: json['external_id'] as String,
  title: DtoJsonConverters.localizedStringFromJson(json['title']),
  shortDescription: DtoJsonConverters.localizedStringFromJson(
    json['short_description'],
  ),
  description: DtoJsonConverters.localizedStringFromJson(json['description']),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  ratingAvg: (json['rating_avg'] as num?)?.toDouble() ?? 0,
  ratingDistribution: json['rating_distribution'] == null
      ? const <String, int>{}
      : DtoJsonConverters.ratingDistributionFromJson(
          json['rating_distribution'],
        ),
  topReviews: json['top_reviews'] == null
      ? const <Map<String, dynamic>>[]
      : DtoJsonConverters.topReviewsFromJson(json['top_reviews']),
  releaseDate: DateTime.parse(json['release_date'] as String),
  iconUrl: json['icon_url'] as String,
  isPaid: json['is_paid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currency_code'] as String? ?? 'USD',
  discountPrice: (json['discount_price'] as num?)?.toDouble(),
  url: json['url'] as String,
  technicalInfo: json['technical_info'] as String?,
  screenshots: json['screenshots'] == null
      ? const <String>[]
      : DtoJsonConverters.stringListFromJson(json['screenshots']),
  supportedLanguages: json['supported_languages'] == null
      ? const <String>[]
      : DtoJsonConverters.stringListFromJson(json['supported_languages']),
  containsAds: json['contains_ads'] as bool?,
  containsPaidContent: json['contains_paid_content'] as bool?,
  version: json['version'] as String?,
  size: json['size'] as String?,
  eventText: DtoJsonConverters.localizedStringNullableFromJson(
    json['event_text'],
  ),
  whatsNewText: DtoJsonConverters.localizedStringFromJson(
    json['whats_new_text'],
  ),
  downloadCount: (json['download_count'] as num?)?.toInt(),
  ageRating: (json['age_rating'] as num?)?.toInt(),
  isKidsFriendly: json['is_kids_friendly'] as bool?,
  ageRatingReasons: DtoJsonConverters.localizedStringListFromJson(
    json['age_rating_reasons'],
  ),
  permissions: DtoJsonConverters.localizedStringListFromJson(
    json['permissions'],
  ),
  lastUpdated: json['last_updated'] == null
      ? null
      : DateTime.parse(json['last_updated'] as String),
  creatorDescription: json['creator_description'] == null
      ? const <String, String>{}
      : DtoJsonConverters.localizedStringFromJson(json['creator_description']),
  isOnline: json['is_online'] as bool?,
  hasMultiplayer: json['has_multiplayer'] as bool?,
  gameModes: json['game_modes'] as String?,
  hasControllerSupport: json['has_controller_support'] as bool?,
  achievements: json['achievements'] == null
      ? const <LocalizedString>[]
      : DtoJsonConverters.localizedStringListFromJson(json['achievements']),
  developer: json['developer'] == null
      ? null
      : DeveloperDto.fromJson(json['developer'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameDtoToJson(GameDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'external_id': instance.externalId,
  'title': instance.title,
  'short_description': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
  'rating_avg': instance.ratingAvg,
  'rating_distribution': instance.ratingDistribution,
  'top_reviews': instance.topReviews,
  'release_date': instance.releaseDate.toIso8601String(),
  'icon_url': instance.iconUrl,
  'is_paid': instance.isPaid,
  'price': instance.price,
  'currency_code': instance.currencyCode,
  'discount_price': instance.discountPrice,
  'url': instance.url,
  'technical_info': instance.technicalInfo,
  'screenshots': instance.screenshots,
  'supported_languages': instance.supportedLanguages,
  'contains_ads': instance.containsAds,
  'contains_paid_content': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'event_text': instance.eventText,
  'whats_new_text': instance.whatsNewText,
  'download_count': instance.downloadCount,
  'age_rating': instance.ageRating,
  'is_kids_friendly': instance.isKidsFriendly,
  'age_rating_reasons': instance.ageRatingReasons,
  'permissions': instance.permissions,
  'last_updated': instance.lastUpdated?.toIso8601String(),
  'creator_description': instance.creatorDescription,
  'is_online': instance.isOnline,
  'has_multiplayer': instance.hasMultiplayer,
  'game_modes': instance.gameModes,
  'has_controller_support': instance.hasControllerSupport,
  'achievements': instance.achievements,
  'developer': instance.developer,
  'categories': instance.categories,
  'tags': instance.tags,
};

AppDto _$AppDtoFromJson(Map<String, dynamic> json) => AppDto(
  type: json['type'] as String? ?? 'app',
  id: json['id'] as String,
  externalId: json['external_id'] as String,
  title: DtoJsonConverters.localizedStringFromJson(json['title']),
  shortDescription: DtoJsonConverters.localizedStringFromJson(
    json['short_description'],
  ),
  description: DtoJsonConverters.localizedStringFromJson(json['description']),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  ratingAvg: (json['rating_avg'] as num?)?.toDouble() ?? 0,
  ratingDistribution: json['rating_distribution'] == null
      ? const <String, int>{}
      : DtoJsonConverters.ratingDistributionFromJson(
          json['rating_distribution'],
        ),
  topReviews: json['top_reviews'] == null
      ? const <Map<String, dynamic>>[]
      : DtoJsonConverters.topReviewsFromJson(json['top_reviews']),
  releaseDate: DateTime.parse(json['release_date'] as String),
  iconUrl: json['icon_url'] as String,
  isPaid: json['is_paid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currency_code'] as String? ?? 'USD',
  discountPrice: (json['discount_price'] as num?)?.toDouble(),
  url: json['url'] as String,
  screenshots: json['screenshots'] == null
      ? const <String>[]
      : DtoJsonConverters.stringListFromJson(json['screenshots']),
  supportedLanguages: json['supported_languages'] == null
      ? const <String>[]
      : DtoJsonConverters.stringListFromJson(json['supported_languages']),
  containsAds: json['contains_ads'] as bool?,
  containsPaidContent: json['contains_paid_content'] as bool?,
  version: json['version'] as String?,
  size: json['size'] as String?,
  eventText: DtoJsonConverters.localizedStringNullableFromJson(
    json['event_text'],
  ),
  whatsNewText: DtoJsonConverters.localizedStringFromJson(
    json['whats_new_text'],
  ),
  downloadCount: (json['download_count'] as num?)?.toInt(),
  ageRating: (json['age_rating'] as num?)?.toInt(),
  isKidsFriendly: json['is_kids_friendly'] as bool?,
  ageRatingReasons: DtoJsonConverters.localizedStringListFromJson(
    json['age_rating_reasons'],
  ),
  permissions: DtoJsonConverters.localizedStringListFromJson(
    json['permissions'],
  ),
  lastUpdated: json['last_updated'] == null
      ? null
      : DateTime.parse(json['last_updated'] as String),
  creatorDescription: json['creator_description'] == null
      ? const <String, String>{}
      : DtoJsonConverters.localizedStringFromJson(json['creator_description']),
  packageName: json['package_name'] as String,
  developer: json['developer'] == null
      ? null
      : DeveloperDto.fromJson(json['developer'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppDtoToJson(AppDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'external_id': instance.externalId,
  'title': instance.title,
  'short_description': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
  'rating_avg': instance.ratingAvg,
  'rating_distribution': instance.ratingDistribution,
  'top_reviews': instance.topReviews,
  'release_date': instance.releaseDate.toIso8601String(),
  'icon_url': instance.iconUrl,
  'is_paid': instance.isPaid,
  'price': instance.price,
  'currency_code': instance.currencyCode,
  'discount_price': instance.discountPrice,
  'url': instance.url,
  'screenshots': instance.screenshots,
  'supported_languages': instance.supportedLanguages,
  'contains_ads': instance.containsAds,
  'contains_paid_content': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'event_text': instance.eventText,
  'whats_new_text': instance.whatsNewText,
  'download_count': instance.downloadCount,
  'age_rating': instance.ageRating,
  'is_kids_friendly': instance.isKidsFriendly,
  'age_rating_reasons': instance.ageRatingReasons,
  'permissions': instance.permissions,
  'last_updated': instance.lastUpdated?.toIso8601String(),
  'creator_description': instance.creatorDescription,
  'package_name': instance.packageName,
  'developer': instance.developer,
  'categories': instance.categories,
  'tags': instance.tags,
};

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
  type: json['type'] as String? ?? 'book',
  id: json['id'] as String,
  externalId: json['external_id'] as String,
  title: DtoJsonConverters.localizedStringFromJson(json['title']),
  shortDescription: DtoJsonConverters.localizedStringFromJson(
    json['short_description'],
  ),
  description: DtoJsonConverters.localizedStringFromJson(json['description']),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
  ratingAvg: (json['rating_avg'] as num?)?.toDouble() ?? 0,
  ratingDistribution: json['rating_distribution'] == null
      ? const <String, int>{}
      : DtoJsonConverters.ratingDistributionFromJson(
          json['rating_distribution'],
        ),
  topReviews: json['top_reviews'] == null
      ? const <Map<String, dynamic>>[]
      : DtoJsonConverters.topReviewsFromJson(json['top_reviews']),
  releaseDate: DateTime.parse(json['release_date'] as String),
  iconUrl: json['icon_url'] as String,
  isPaid: json['is_paid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currency_code'] as String? ?? 'USD',
  discountPrice: (json['discount_price'] as num?)?.toDouble(),
  url: json['url'] as String,
  publisher: BookPublisherDto.fromJson(
    json['publisher'] as Map<String, dynamic>,
  ),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  pageCount: (json['page_count'] as num).toInt(),
  language: json['language'] as String,
  format: json['format'] as String,
  hasAudioVersion: json['has_audio_version'] as bool,
  audioDuration: (json['audio_duration'] as num?)?.toInt(),
  narrator: json['narrator'] as String?,
  isSeries: json['is_series'] as bool,
  seriesName: json['series_name'] as String?,
  seriesNumber: (json['series_number'] as num?)?.toInt(),
  sampleAvailable: json['sample_available'] as bool,
  isAbridged: json['is_abridged'] as bool,
  publicationDate: DateTime.parse(json['publication_date'] as String),
  awards: json['awards'] == null
      ? const <String>[]
      : DtoJsonConverters.stringListFromJson(json['awards']),
);

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'external_id': instance.externalId,
  'title': instance.title,
  'short_description': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
  'rating_avg': instance.ratingAvg,
  'rating_distribution': instance.ratingDistribution,
  'top_reviews': instance.topReviews,
  'release_date': instance.releaseDate.toIso8601String(),
  'icon_url': instance.iconUrl,
  'is_paid': instance.isPaid,
  'price': instance.price,
  'currency_code': instance.currencyCode,
  'discount_price': instance.discountPrice,
  'url': instance.url,
  'publisher': instance.publisher,
  'categories': instance.categories,
  'tags': instance.tags,
  'page_count': instance.pageCount,
  'language': instance.language,
  'format': instance.format,
  'has_audio_version': instance.hasAudioVersion,
  'audio_duration': instance.audioDuration,
  'narrator': instance.narrator,
  'is_series': instance.isSeries,
  'series_name': instance.seriesName,
  'series_number': instance.seriesNumber,
  'sample_available': instance.sampleAvailable,
  'is_abridged': instance.isAbridged,
  'publication_date': instance.publicationDate.toIso8601String(),
  'awards': instance.awards,
};
