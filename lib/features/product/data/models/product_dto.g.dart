// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDto _$GameDtoFromJson(Map<String, dynamic> json) => GameDto(
  type: json['type'] as String? ?? 'game',
  id: json['id'] as String,
  title: Map<String, String>.from(json['title'] as Map),
  creator: Map<String, String>.from(json['creator'] as Map),
  shortDescription: Map<String, String>.from(json['shortDescription'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  iconUrl: json['iconUrl'] as String,
  isPaid: json['isPaid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String? ?? 'USD',
  discountPrice: (json['discountPrice'] as num?)?.toDouble(),
  technicalInfo: json['technicalInfo'] as String?,
  containsAds: json['containsAds'] as bool,
  containsPaidContent: json['containsPaidContent'] as bool,
  version: json['version'] as String,
  size: json['size'] as String,
  eventText: (json['eventText'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  whatsNewText: Map<String, String>.from(json['whatsNewText'] as Map),
  downloadCount: (json['downloadCount'] as num).toInt(),
  ageRating: (json['ageRating'] as num).toInt(),
  isKidsFriendly: json['isKidsFriendly'] as bool,
  ageRatingReasons: (json['ageRatingReasons'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  websiteUrl: json['websiteUrl'] as String,
  emailSupport: json['emailSupport'] as String,
  privacyPolicyUrl: json['privacyPolicyUrl'] as String,
  creatorDescription: Map<String, String>.from(
    json['creatorDescription'] as Map,
  ),
  url: json['url'] as String,
  developerCompany: Map<String, String>.from(json['developerCompany'] as Map),
  developerAddress: Map<String, String>.from(json['developerAddress'] as Map),
  developerCity: Map<String, String>.from(json['developerCity'] as Map),
  developerCountry: Map<String, String>.from(json['developerCountry'] as Map),
  developerPhone: json['developerPhone'] as String,
  categories: (json['gameGenre'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  isOnline: json['isOnline'] as bool?,
  hasMultiplayer: json['hasMultiplayer'] as bool?,
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const <LocalizedString>[],
  gameModes: json['gameModes'] as String?,
  hasControllerSupport: json['hasControllerSupport'] as bool?,
  supportedLanguages:
      (json['supportedLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$GameDtoToJson(GameDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'shortDescription': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'currencyCode': instance.currencyCode,
  'discountPrice': instance.discountPrice,
  'technicalInfo': instance.technicalInfo,
  'containsAds': instance.containsAds,
  'containsPaidContent': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'eventText': instance.eventText,
  'whatsNewText': instance.whatsNewText,
  'downloadCount': instance.downloadCount,
  'ageRating': instance.ageRating,
  'isKidsFriendly': instance.isKidsFriendly,
  'ageRatingReasons': instance.ageRatingReasons,
  'permissions': instance.permissions,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'creatorDescription': instance.creatorDescription,
  'url': instance.url,
  'developerCompany': instance.developerCompany,
  'developerAddress': instance.developerAddress,
  'developerCity': instance.developerCity,
  'developerCountry': instance.developerCountry,
  'developerPhone': instance.developerPhone,
  'gameGenre': instance.categories,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'achievements': instance.achievements,
  'gameModes': instance.gameModes,
  'hasControllerSupport': instance.hasControllerSupport,
  'supportedLanguages': instance.supportedLanguages,
};

AppDto _$AppDtoFromJson(Map<String, dynamic> json) => AppDto(
  type: json['type'] as String? ?? 'app',
  id: json['id'] as String,
  title: Map<String, String>.from(json['title'] as Map),
  creator: Map<String, String>.from(json['creator'] as Map),
  shortDescription: Map<String, String>.from(json['shortDescription'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  iconUrl: json['iconUrl'] as String,
  isPaid: json['isPaid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String? ?? 'USD',
  discountPrice: (json['discountPrice'] as num?)?.toDouble(),
  containsAds: json['containsAds'] as bool,
  containsPaidContent: json['containsPaidContent'] as bool,
  version: json['version'] as String,
  size: json['size'] as String,
  eventText: (json['eventText'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  whatsNewText: Map<String, String>.from(json['whatsNewText'] as Map),
  downloadCount: (json['downloadCount'] as num).toInt(),
  ageRating: (json['ageRating'] as num).toInt(),
  isKidsFriendly: json['isKidsFriendly'] as bool,
  ageRatingReasons: (json['ageRatingReasons'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  websiteUrl: json['websiteUrl'] as String,
  emailSupport: json['emailSupport'] as String,
  privacyPolicyUrl: json['privacyPolicyUrl'] as String,
  creatorDescription: Map<String, String>.from(
    json['creatorDescription'] as Map,
  ),
  url: json['url'] as String,
  developerCompany: Map<String, String>.from(json['developerCompany'] as Map),
  developerAddress: Map<String, String>.from(json['developerAddress'] as Map),
  developerCity: Map<String, String>.from(json['developerCity'] as Map),
  developerCountry: Map<String, String>.from(json['developerCountry'] as Map),
  developerPhone: json['developerPhone'] as String,
  categories: (json['appCategory'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  packageName: json['packageName'] as String,
  supportedLanguages:
      (json['supportedLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$AppDtoToJson(AppDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'shortDescription': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'currencyCode': instance.currencyCode,
  'discountPrice': instance.discountPrice,
  'containsAds': instance.containsAds,
  'containsPaidContent': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'eventText': instance.eventText,
  'whatsNewText': instance.whatsNewText,
  'downloadCount': instance.downloadCount,
  'ageRating': instance.ageRating,
  'isKidsFriendly': instance.isKidsFriendly,
  'ageRatingReasons': instance.ageRatingReasons,
  'permissions': instance.permissions,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'creatorDescription': instance.creatorDescription,
  'url': instance.url,
  'developerCompany': instance.developerCompany,
  'developerAddress': instance.developerAddress,
  'developerCity': instance.developerCity,
  'developerCountry': instance.developerCountry,
  'developerPhone': instance.developerPhone,
  'appCategory': instance.categories,
  'packageName': instance.packageName,
  'supportedLanguages': instance.supportedLanguages,
};

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
  type: json['type'] as String? ?? 'book',
  id: json['id'] as String,
  title: Map<String, String>.from(json['title'] as Map),
  creator: Map<String, String>.from(json['creator'] as Map),
  shortDescription: Map<String, String>.from(json['shortDescription'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  iconUrl: json['iconUrl'] as String,
  isPaid: json['isPaid'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String? ?? 'USD',
  discountPrice: (json['discountPrice'] as num?)?.toDouble(),
  creatorDescription: Map<String, String>.from(
    json['creatorDescription'] as Map,
  ),
  url: json['url'] as String,
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  categories: (json['genre'] as List<dynamic>)
      .map((e) => Map<String, String>.from(e as Map))
      .toList(),
  publisher: Map<String, String>.from(json['publisher'] as Map),
  pageCount: (json['pageCount'] as num).toInt(),
  language: json['language'] as String,
  format: json['format'] as String,
  publicationDate: DateTime.parse(json['publicationDate'] as String),
  hasAudioVersion: json['hasAudioVersion'] as bool? ?? false,
  audioDuration: (json['audioDuration'] as num?)?.toInt(),
  narrator: json['narrator'] as String?,
  isSeries: json['isSeries'] as bool? ?? false,
  seriesName: json['seriesName'] as String?,
  seriesNumber: (json['seriesNumber'] as num?)?.toInt(),
  sampleAvailable: json['sampleAvailable'] as bool? ?? false,
  isAbridged: json['isAbridged'] as bool? ?? false,
  awards:
      (json['awards'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'shortDescription': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'currencyCode': instance.currencyCode,
  'discountPrice': instance.discountPrice,
  'creatorDescription': instance.creatorDescription,
  'url': instance.url,
  'tags': instance.tags,
  'genre': instance.categories,
  'publisher': instance.publisher,
  'pageCount': instance.pageCount,
  'language': instance.language,
  'format': instance.format,
  'publicationDate': instance.publicationDate.toIso8601String(),
  'hasAudioVersion': instance.hasAudioVersion,
  'audioDuration': instance.audioDuration,
  'narrator': instance.narrator,
  'isSeries': instance.isSeries,
  'seriesName': instance.seriesName,
  'seriesNumber': instance.seriesNumber,
  'sampleAvailable': instance.sampleAvailable,
  'isAbridged': instance.isAbridged,
  'awards': instance.awards,
};
