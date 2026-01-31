import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

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
  final String shortDescription;
  @override
  final String description;
  @override
  final double rating;
  @override
  final int reviewsCount;
  @override
  final DateTime releaseDate;
  @override
  final String iconUrl;
  @override
  final bool isPaid;
  @override
  final double? price;
  @override
  String get technicalInfo => size;
  @override
  final bool containsAds;
  @override
  final bool containsPaidContent;
  @override
  final String version; // "2.1.0"
  @override
  final String size; // "15.3 MB"
  @override
  final String? eventText;
  @override
  final String? whatsNewText;
  @override
  final int downloadCount;
  @override
  final int ageRating;
  @override
  final List<String> ageRatingReasons;
  @override
  final List<String> permissions;
  @override
  final DateTime lastUpdated; // Последнее обновление
  final List<String> gameGenre; // "РПГ", "Стратегия", "Пазлы"
  @override
  final List<String> screenshots; // Скриншоты
  @override
  final List<String> tags; // Теги
  @override
  final String websiteUrl;
  @override
  final String emailSupport;
  @override
  final String privacyPolicyUrl;
  @override
  final String creatorDescription;

  // Информация о разработчике
  @override
  final String developerCompany; // "Take-Two Interactive Software, Inc."
  @override
  final String developerAddress; // "110 W 44th St"
  @override
  final String developerCity; // "New York, NY 10036"
  @override
  final String developerCountry; // "United States"
  @override
  final String developerPhone; // "+1 646-817-2429"

  final bool isOnline; // Онлайн игра?
  final bool hasMultiplayer; // Мультиплеер
  final bool hasAchievements; // Достижения
  final String gameModes; // "Single-player", "Co-op"
  final bool hasControllerSupport;

  Game({
    required this.type,
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.shortDescription,
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
    this.eventText,
    this.whatsNewText,
    required this.size,
    required this.downloadCount,
    required this.permissions,
    required this.releaseDate,
    required this.lastUpdated,
    required this.websiteUrl,
    required this.emailSupport,
    required this.privacyPolicyUrl,
    required this.creatorDescription,
    required this.developerCompany,
    required this.developerAddress,
    required this.developerCity,
    required this.developerCountry,
    required this.developerPhone,
    required this.ageRating,
    required this.ageRatingReasons,
    required this.reviewsCount,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
