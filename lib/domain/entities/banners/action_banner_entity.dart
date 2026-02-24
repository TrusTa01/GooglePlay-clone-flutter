import 'package:google_play/domain/entities/banners/banner_entity.dart';

final class ActionBannerEntity extends BannerEntity {
  final String productId;

  ActionBannerEntity({
    required super.id,
    required super.type,
    required super.imageAssetPath,
    required super.title,
    required super.topToolTipText,
    required this.productId,
    required super.description,
  });
}
