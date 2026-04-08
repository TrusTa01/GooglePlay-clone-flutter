import 'package:google_play/core/domain/entities/base_entity.dart';

enum BannerType { event, action }

abstract class BannerEntity extends Entity {
  final BannerType type;
  final String imageAssetPath;
  final String? title;
  final String? topTooltipText;
  final String? description;

  const BannerEntity({
    required super.id,
    required this.type,
    required this.imageAssetPath,
    this.title,
    this.topTooltipText,
    this.description,
  });
}
