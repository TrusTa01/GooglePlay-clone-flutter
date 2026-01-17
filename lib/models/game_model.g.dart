// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models/game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
  type: json['type'] as String,
  id: json['id'] as String,
  title: json['title'] as String,
  creator: json['creator'] as String,
  rating: (json['rating'] as num).toDouble(),
  iconUrl: json['iconUrl'] as String,
  gameGenre: json['gameGenre'] as String,
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tags: json['tags'] as String,
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
  ageRating: (json['ageRating'] as num).toInt(),
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'description': instance.description,
  'rating': instance.rating,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'ageRating': instance.ageRating,
  'containsAds': instance.containsAds,
  'containsPaidContent': instance.containsPaidContent,
  'version': instance.version,
  'size': instance.size,
  'downloadCount': instance.downloadCount,
  'permissions': instance.permissions,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'gameGenre': instance.gameGenre,
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'creatorDescription': instance.creatorDescription,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'hasAchievements': instance.hasAchievements,
  'gameModes': instance.gameModes,
  'hasControllerSupport': instance.hasControllerSupport,
};
