import 'package:json_annotation/json_annotation.dart';

import '../product_interface.dart';

part '../product_models.g/game_model.g.dart';

@JsonSerializable()
class Game implements Product {
  @override
  final String type;
  @override
  final String id;
  @override
  final String title;
  @override
  final String creator;
  @override
  final double rating;
  @override
  final String iconUrl;
  @override
  final bool isPaid;
  @override
  final double? price;
  
  final bool containsAds;
  final bool containsPaidContent;
  final String description;
  final String version; // "2.1.0"
  final String size; // "15.3 MB"
  final int downloadCount;
  final List<String> permissions;
  final DateTime releaseDate; // Дата выхода
  final DateTime lastUpdated; // Последнее обновление
  final String gameGenre; // "РПГ", "Стратегия", "Пазлы"
  final String screenshots; // Скриншоты
  final String tags; // Теги
  final String websiteUrl;
  final String emailSupport;
  final String privacyPolicyUrl;
  final String creatorDescription;
  final bool isOnline; // Онлайн игра?
  final bool hasMultiplayer; // Мультиплеер
  final int ageRating; // "3+", "12+", "18+"
  final bool hasAchievements; // Достижения
  final String gameModes; // "Single-player", "Co-op"
  final bool hasControllerSupport;

  Game({
    required this.type,
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.iconUrl,
    required this.gameGenre,
    required this.screenshots,
    required this.tags,
    required this.isOnline,
    required this.hasMultiplayer,
    required this.hasAchievements,
    required this.gameModes,
    required this.isPaid,
    required this.hasControllerSupport,
    this.price,
    required this.containsAds,
    required this.containsPaidContent,
    required this.description,
    required this.version,
    required this.size,
    required this.downloadCount,
    required this.permissions,
    required this.releaseDate,
    required this.lastUpdated,
    required this.websiteUrl,
    required this.emailSupport,
    required this.privacyPolicyUrl,
    required this.creatorDescription,
    required this.ageRating,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
