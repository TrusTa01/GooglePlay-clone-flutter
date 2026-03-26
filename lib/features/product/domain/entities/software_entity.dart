import 'package:google_play/features/product/domain/entities/developer_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';

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
  final bool isKidsFriendly;
  final List<String> ageRatingReasons;
  final List<String> permissions;
  final List<String> supportedLanguages;
  final DeveloperEntity developer;

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
    required this.isKidsFriendly,
    required this.ageRatingReasons,
    required this.permissions,
    this.supportedLanguages = const [],
    required this.developer,
  });

  @override
  String get technicalInfo => size;
}
