// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product_models/game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
  type: json['type'] as String,
  id: json['id'] as String,
  title: json['title'] as String,
  creator: json['creator'] as String,
  rating: (json['rating'] as num).toDouble(),
  shortDescription: json['shortDescription'] as String,
  iconUrl: json['iconUrl'] as String,
  gameGenre: (json['gameGenre'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  isOnline: json['isOnline'] as bool,
  hasMultiplayer: json['hasMultiplayer'] as bool,
  hasAchievements: json['hasAchievements'] as bool,
  gameModes: json['gameModes'] as String,
  isPaid: json['isPaid'] as bool,
  hasControllerSupport: json['hasControllerSupport'] as bool,
  price: (json['price'] as num?)?.toDouble(),
  containsAds: json['containsAds'] as bool,
  containsPaidContent: json['containsPaidContent'] as bool,
  description: json['description'] as String,
  version: json['version'] as String,
  eventText: json['eventText'] as String?,
  whatsNewText: json['whatsNewText'] as String?,
  size: json['size'] as String,
  downloadCount: (json['downloadCount'] as num).toInt(),
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  websiteUrl: json['websiteUrl'] as String,
  emailSupport: json['emailSupport'] as String,
  privacyPolicyUrl: json['privacyPolicyUrl'] as String,
  creatorDescription: json['creatorDescription'] as String,
  developerCompany: json['developerCompany'] as String,
  developerAddress: json['developerAddress'] as String,
  developerCity: json['developerCity'] as String,
  developerCountry: json['developerCountry'] as String,
  developerPhone: json['developerPhone'] as String,
  ageRating: (json['ageRating'] as num).toInt(),
  ageRatingReasons: (json['ageRatingReasons'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
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
  'containsAds': instance.containsAds,
  'containsPaidContent': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'eventText': instance.eventText,
  'whatsNewText': instance.whatsNewText,
  'downloadCount': instance.downloadCount,
  'ageRating': instance.ageRating,
  'ageRatingReasons': instance.ageRatingReasons,
  'permissions': instance.permissions,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'gameGenre': instance.gameGenre,
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'creatorDescription': instance.creatorDescription,
  'developerCompany': instance.developerCompany,
  'developerAddress': instance.developerAddress,
  'developerCity': instance.developerCity,
  'developerCountry': instance.developerCountry,
  'developerPhone': instance.developerPhone,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'hasAchievements': instance.hasAchievements,
  'gameModes': instance.gameModes,
  'hasControllerSupport': instance.hasControllerSupport,
};
