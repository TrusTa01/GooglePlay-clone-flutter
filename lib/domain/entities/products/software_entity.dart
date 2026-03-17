import 'package:google_play/domain/entities/products/product_entity.dart';

abstract class SoftwareEntity extends ProductEntity {
  final List<String> screenshots;
  final String size;
  final String version;
  final int downloadCount;
  final bool containsAds;
  final bool containsPaidContent;
  final String? eventText;
  final String whatsNewText;
  final DateTime lastUpdated;
  final int ageRating;
  final List<String> ageRatingReasons;
  final List<String> permissions;
  final String websiteUrl;
  final String emailSupport;
  final String privacyPolicyUrl;
  final String developerCompany;
  final String developerAddress;
  final String developerCity;
  final String developerCountry;
  final String developerPhone;

  const SoftwareEntity({
    required super.type,
    required super.id,
    required super.title,
    required super.creator,
    required super.shortDescription,
    required super.description,
    required super.releaseDate,
    required super.rating,
    required super.reviewsCount,
    required super.iconUrl,
    required super.isPaid,
    required super.price,
    super.currencyCode = 'USD',
    super.discountPrice,
    required super.creatorDescription,
    required super.url,
    required super.tags,
    required super.categories,
    required this.screenshots,
    required this.size,
    required this.version,
    required this.downloadCount,
    required this.containsAds,
    required this.containsPaidContent,
    this.eventText,
    required this.whatsNewText,
    required this.lastUpdated,
    required this.ageRating,
    required this.ageRatingReasons,
    required this.permissions,
    required this.websiteUrl,
    required this.emailSupport,
    required this.privacyPolicyUrl,
    required this.developerCompany,
    required this.developerAddress,
    required this.developerCity,
    required this.developerCountry,
    required this.developerPhone,
  });

  @override
  String get technicalInfo => size;
}
