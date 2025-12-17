// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product_models/game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
  id: json['id'] as String,
  title: json['title'] as String,
  creator: json['creator'] as String,
  rating: (json['rating'] as num).toDouble(),
  category: json['category'] as String,
  iconUrl: json['iconUrl'] as String,
  gameGenre: json['gameGenre'] as String,
  screenshots: json['screenshots'] as String,
  tags: json['tags'] as String,
  isOnline: json['isOnline'] as bool,
  hasMultiplayer: json['hasMultiplayer'] as bool,
  hasAchievements: json['hasAchievements'] as bool,
  gameModes: json['gameModes'] as String,
  isPaid: json['isPaid'] as bool,
  hasControllerSupport: json['hasControllerSupport'] as bool,
  price: json['price'] as double?,
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
  creatorDescriotion: json['creatorDescriotion'] as String,
  ageRating: (json['ageRating'] as num).toInt(),
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'rating': instance.rating,
  'category': instance.category,
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'containsAds': instance.containsAds,
  'containsPaidContent': instance.containsPaidContent,
  'description': instance.description,
  'version': instance.version,
  'size': instance.size,
  'downloadCount': instance.downloadCount,
  'permissions': instance.permissions,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'gameGenre': instance.gameGenre,
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'creatorDescriotion': instance.creatorDescriotion,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'ageRating': instance.ageRating,
  'hasAchievements': instance.hasAchievements,
  'gameModes': instance.gameModes,
  'hasControllerSupport': instance.hasControllerSupport,
};
