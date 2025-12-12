import 'package:json_annotation/json_annotation.dart';

import '../product_interface.dart';

part '../product_models.g/app_model.g.dart';

@JsonSerializable()
class App implements Product {
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

  final String version; // "2.1.0"
  final String size; // "15.3 MB"
  final String minAndroidVersion; // "Android 7.0+"
  final bool containsAds; // true/false
  final bool isEditorChoice; // Выбор редакции
  final int downloadCount; // 1_000_000
  final DateTime releaseDate; // Дата выхода
  final DateTime lastUpdated; // Последнее обновление
  final List<String> permissions; // ["Камера", "Микрофон"]
  final List<String> screenshots; // URLs скриншотов
  final String packageName; // "com.google.android.youtube"
  final List<String> supportedLanguages; // ["RU", "EN"]
  final int ageRating; // 3+, 12+, 18+
  final bool isFree; // Бесплатное/платное
  final double price; // 0.0 если free
  final bool hasInAppPurchases; // Внутриигровые покупки
  final String privacyPolicyUrl; // Ссылка на политику
  final String websiteUrl; // Сайт разработчика
  final String emailSupport;

  App({
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.category,
    required this.iconUrl,
    required this.version,
    required this.size,
    required this.minAndroidVersion,
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
    required this.isFree,
    required this.price,
    required this.hasInAppPurchases,
    required this.privacyPolicyUrl,
    required this.websiteUrl,
    required this.emailSupport,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
