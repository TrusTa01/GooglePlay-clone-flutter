import 'package:google_play/features/product/domain/entities/software_entity.dart';

final class AppEntity extends SoftwareEntity {
  final String packageName;

  const AppEntity({
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
    required super.screenshots,
    required super.size,
    required super.version,
    required super.downloadCount,
    required super.containsAds,
    required super.containsPaidContent,
    super.eventText,
    required super.whatsNewText,
    required super.lastUpdated,
    required super.ageRating,
    required super.isKidsFriendly,
    required super.ageRatingReasons,
    required super.permissions,
    super.supportedLanguages,
    required super.developer,
    required this.packageName,
  });
}
