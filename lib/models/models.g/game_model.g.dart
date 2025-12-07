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
  platforms: (json['platforms'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  gameGenre: json['gameGenre'] as String,
  isOnline: json['isOnline'] as bool,
  hasMultiplayer: json['hasMultiplayer'] as bool,
  ageCategory: json['ageCategory'] as String,
  hasControllerSupport: json['hasControllerSupport'] as bool,
  achievements: (json['achievements'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  gameModes: json['gameModes'] as String,
  storyDuration: json['storyDuration'] as String?,
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'rating': instance.rating,
  'category': instance.category,
  'iconUrl': instance.iconUrl,
  'platforms': instance.platforms,
  'gameGenre': instance.gameGenre,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'ageCategory': instance.ageCategory,
  'hasControllerSupport': instance.hasControllerSupport,
  'achievements': instance.achievements,
  'gameModes': instance.gameModes,
  'storyDuration': instance.storyDuration,
};
