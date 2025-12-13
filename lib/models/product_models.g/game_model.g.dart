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
  ageCategory: json['ageCategory'] as String,
  hasAchievements: json['hasAchievements'] as bool,
  gameModes: json['gameModes'] as String,
  isPaid: json['isPaid'] as bool,
  price: json['price'] as String?,
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'rating': instance.rating,
  'category': instance.category,
  'iconUrl': instance.iconUrl,
  'gameGenre': instance.gameGenre,
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'isOnline': instance.isOnline,
  'hasMultiplayer': instance.hasMultiplayer,
  'ageCategory': instance.ageCategory,
  'hasAchievements': instance.hasAchievements,
  'gameModes': instance.gameModes,
  'isPaid': instance.isPaid,
  'price': instance.price,
};
