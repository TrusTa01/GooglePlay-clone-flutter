import 'package:google_play/domain/entities/banners/banner_entity.dart';

final class SimpleBannerEntity extends BannerEntity {
  final String? eventId;
  final String? eventCategory;
  final String? eventDescription;

  SimpleBannerEntity({
    required super.id,
    required super.type,
    required super.imageAssetPath,
    required super.title,
    required super.topToolTipText,
    this.eventId,
    this.eventCategory,
    this.eventDescription,
    required super.description,
  });
}
