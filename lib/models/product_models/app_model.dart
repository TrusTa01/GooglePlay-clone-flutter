import 'package:json_annotation/json_annotation.dart';

import 'package:google_play/models/models.dart';

part '../product_models.g/app_model.g.dart';

@JsonSerializable()
class App implements Product {
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
  final String version; // "2.1.0"
  @override
  final String size; // "15.3 MB"
  @override
  final int ageRating;
  @override
  final List<String> ageRatingReasons;
  final List<String> appCategory;
  @override
  final String creatorDescription;
  @override
  final String url;
  @override
  final String? eventText;
  @override
  final String? whatsNewText;
  @override
  final bool containsAds; // true/false
  final bool isEditorChoice; // Выбор редакции
  @override
  final int downloadCount; // 1_000_000
  @override
  final DateTime lastUpdated; // Последнее обновление
  @override
  final List<String> permissions; // ["Камера", "Микрофон"]
  @override
  final List<String> screenshots; // URLs скриншотов
  @override
  final List<String> tags;
  final String packageName; // "com.google.android.youtube"
  final List<String> supportedLanguages; // ["RU", "EN"]
  @override
  final bool containsPaidContent; // Внутриигровые покупки
  @override
  final String privacyPolicyUrl; // Ссылка на политику
  @override
  final String websiteUrl; // Сайт разработчика
  @override
  final String emailSupport;
  // Информация о разработчике
  @override
  final String developerCompany;
  @override // "Take-Two Interactive Software, Inc."
  final String developerAddress; // "110 W 44th St"
  @override
  final String developerCity; // "New York, NY 10036"
  @override
  final String developerCountry; // "United States"
  @override
  final String developerPhone; // "+1 646-817-2429"

  App({
    required this.type,
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.shortDescription,
    required this.description,
    required this.iconUrl,
    required this.isPaid,
    required this.version,
    required this.size,
    required this.containsAds,
    required this.isEditorChoice,
    required this.downloadCount,
    required this.releaseDate,
    required this.lastUpdated,
    required this.permissions,
    required this.screenshots,
    required this.tags,
    required this.packageName,
    required this.supportedLanguages,
    required this.ageRating,
    required this.ageRatingReasons,
    required this.privacyPolicyUrl,
    required this.websiteUrl,
    required this.emailSupport,
    required this.creatorDescription,
    required this.url,
    required this.developerCompany,
    required this.developerAddress,
    required this.developerCity,
    required this.developerCountry,
    required this.developerPhone,
    this.eventText,
    this.whatsNewText,
    this.price,
    required this.containsPaidContent,
    required this.appCategory,
    required this.reviewsCount,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
