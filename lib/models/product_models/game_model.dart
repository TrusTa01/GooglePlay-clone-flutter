import 'package:json_annotation/json_annotation.dart';

import '../product_interface.dart';

part '../product_models.g/game_model.g.dart';

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

  final String gameGenre; // "РПГ", "Стратегия", "Пазлы"
  final String screenshots; // Скриншоты
  final String tags; // Теги
  final bool isOnline; // Онлайн игра
  final bool hasMultiplayer; // Мультиплеер
  final String ageCategory; // "3+", "12+", "18+"
  final bool hasAchievements; // Достижения
  final String gameModes; // "Single-player", "Co-op"

  Game({
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.category,
    required this.iconUrl,
    required this.gameGenre,
    required this.screenshots,
    required this.tags,
    required this.isOnline,
    required this.hasMultiplayer,
    required this.ageCategory,
    required this.hasAchievements,
    required this.gameModes,
  });
  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
