import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

final class ActionBannerEntity extends BannerEntity {
  final String productExternalId;

  ActionBannerEntity({
    required super.id,
    required super.type,
    required super.imageAssetPath,
    required super.title,
    required super.topTooltipText,
    required super.description,
    required this.productExternalId,
  });
}
