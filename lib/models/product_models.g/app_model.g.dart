// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product_models/app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) => App(
  type: json['type'] as String,
  id: json['id'] as String,
  title: json['title'] as String,
  creator: json['creator'] as String,
  rating: (json['rating'] as num).toDouble(),
  description: json['description'] as String,
  iconUrl: json['iconUrl'] as String,
  isPaid: json['isPaid'] as bool,
  version: json['version'] as String,
  size: json['size'] as String,
  containsAds: json['containsAds'] as bool,
  isEditorChoice: json['isEditorChoice'] as bool,
  downloadCount: (json['downloadCount'] as num).toInt(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  packageName: json['packageName'] as String,
  supportedLanguages: (json['supportedLanguages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  ageRating: (json['ageRating'] as num).toInt(),
  privacyPolicyUrl: json['privacyPolicyUrl'] as String,
  websiteUrl: json['websiteUrl'] as String,
  emailSupport: json['emailSupport'] as String,
  price: (json['price'] as num?)?.toDouble(),
  containsPaidContent: json['containsPaidContent'] as bool,
);

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'description': instance.description,
  'rating': instance.rating,
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'version': instance.version,
  'size': instance.size,
  'containsAds': instance.containsAds,
  'isEditorChoice': instance.isEditorChoice,
  'downloadCount': instance.downloadCount,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'permissions': instance.permissions,
  'screenshots': instance.screenshots,
  'packageName': instance.packageName,
  'supportedLanguages': instance.supportedLanguages,
  'ageRating': instance.ageRating,
  'containsPaidContent': instance.containsPaidContent,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
};
