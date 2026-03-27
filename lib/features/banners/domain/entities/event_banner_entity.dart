import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

final class EventBannerEntity extends BannerEntity {
  final String? eventId;
  final String? eventCategory;
  final String? eventDescription;

  EventBannerEntity({
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
