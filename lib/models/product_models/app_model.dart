import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part '../app_model.g.dart';

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
  final String description;
  @override
  final double rating;
  @override
  final DateTime releaseDate;
  @override
  final String iconUrl;
  @override
  final int ageRating;
  @override
  final bool isPaid;
  @override
  final double? price;
  @override
  String get technicalInfo => size;

  final String version; // "2.1.0"
  final String size; // "15.3 MB"
  final bool containsAds; // true/false
  final bool isEditorChoice; // Выбор редакции
  final int downloadCount; // 1_000_000
  final DateTime lastUpdated; // Последнее обновление
  final List<String> permissions; // ["Камера", "Микрофон"]
  final List<String> screenshots; // URLs скриншотов
  final String packageName; // "com.google.android.youtube"
  final List<String> supportedLanguages; // ["RU", "EN"]
  final bool containsPaidContent; // Внутриигровые покупки
  final String privacyPolicyUrl; // Ссылка на политику
  final String websiteUrl; // Сайт разработчика
  final String emailSupport;

  App({
    required this.type,
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
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
    required this.packageName,
    required this.supportedLanguages,
    required this.ageRating,
    required this.privacyPolicyUrl,
    required this.websiteUrl,
    required this.emailSupport,
    this.price,
    required this.containsPaidContent,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
