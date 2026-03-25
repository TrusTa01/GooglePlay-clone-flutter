import 'package:google_play/core/domain/entities/base_entity.dart';

enum BannerType { simple, action }

abstract class BannerEntity extends Entity {
  final BannerType type;
  final String imageAssetPath;
  final String title;
  final String? topToolTipText;
  final String description;

  const BannerEntity({
    required super.id,
    required this.type,
    required this.imageAssetPath,
    required this.title,
    required this.topToolTipText,
    required this.description,
  });
}
