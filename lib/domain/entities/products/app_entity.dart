import 'package:google_play/domain/entities/products/software_entity.dart';

final class AppEntity extends SoftwareEntity {
  AppEntity({
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
    required super.creatorDescription,
    required super.url,
    required super.tags,
    required super.screenshots,
    required super.size,
    required super.version,
    required super.downloadCount,
    required super.containsAds,
  });
}
