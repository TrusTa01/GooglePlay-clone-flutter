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
  shortDescription: json['shortDescription'] as String,
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
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  packageName: json['packageName'] as String,
  supportedLanguages: (json['supportedLanguages'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  ageRating: (json['ageRating'] as num).toInt(),
  ageRatingReasons: (json['ageRatingReasons'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  privacyPolicyUrl: json['privacyPolicyUrl'] as String,
  websiteUrl: json['websiteUrl'] as String,
  emailSupport: json['emailSupport'] as String,
  creatorDescription: json['creatorDescription'] as String,
  developerCompany: json['developerCompany'] as String,
  developerAddress: json['developerAddress'] as String,
  developerCity: json['developerCity'] as String,
  developerCountry: json['developerCountry'] as String,
  developerPhone: json['developerPhone'] as String,
  eventText: json['eventText'] as String?,
  whatsNewText: json['whatsNewText'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  containsPaidContent: json['containsPaidContent'] as bool,
  appCategory: (json['appCategory'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
);

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'shortDescription': instance.shortDescription,
  'description': instance.description,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'version': instance.version,
  'size': instance.size,
  'ageRating': instance.ageRating,
  'ageRatingReasons': instance.ageRatingReasons,
  'appCategory': instance.appCategory,
  'creatorDescription': instance.creatorDescription,
  'eventText': instance.eventText,
  'whatsNewText': instance.whatsNewText,
  'containsAds': instance.containsAds,
  'isEditorChoice': instance.isEditorChoice,
  'downloadCount': instance.downloadCount,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'permissions': instance.permissions,
  'screenshots': instance.screenshots,
  'tags': instance.tags,
  'packageName': instance.packageName,
  'supportedLanguages': instance.supportedLanguages,
  'containsPaidContent': instance.containsPaidContent,
  'privacyPolicyUrl': instance.privacyPolicyUrl,
  'websiteUrl': instance.websiteUrl,
  'emailSupport': instance.emailSupport,
  'developerCompany': instance.developerCompany,
  'developerAddress': instance.developerAddress,
  'developerCity': instance.developerCity,
  'developerCountry': instance.developerCountry,
  'developerPhone': instance.developerPhone,
};
