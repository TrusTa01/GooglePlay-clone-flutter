import 'package:json_annotation/json_annotation.dart';

import '../product_interface.dart';

part '../models.g/game_model.g.dart';

@JsonSerializable()
class Game implements Product {
  @override
  final String id;
  @override
  final String title;
  @override
  final String creator;
  @override
  final double rating;
  @override
  final String category;
  @override
  final String iconUrl;

  final List<String> platforms; // ["Android", "iOS"]
  final String gameGenre; // "RPG", "Strategy", "Puzzle"
  final bool isOnline; // Онлайн игра
  final bool hasMultiplayer; // Мультиплеер
  final String ageCategory; // "3+", "12+", "18+"
  final bool hasControllerSupport; // Поддержка геймпада
  final List<String> achievements; // Достижения
  final String gameModes; // "Single-player", "Co-op"
  final String? storyDuration; // "10+ часов" (для RPG)

  Game({
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.category,
    required this.iconUrl,
    required this.platforms,
    required this.gameGenre,
    required this.isOnline,
    required this.hasMultiplayer,
    required this.ageCategory,
    required this.hasControllerSupport,
    required this.achievements,
    required this.gameModes,
    required this.storyDuration,
  }); 
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
