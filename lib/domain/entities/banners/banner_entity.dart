enum BannerType { simple, action }

abstract class BannerEntity {
  final String id;
  final BannerType type;
  final String imageAssetPath;
  final String title;
  final String? topToolTipText;
  final String description;

  BannerEntity({
    required this.id,
    required this.type,
    required this.imageAssetPath,
    required this.title,
    required this.topToolTipText,
    required this.description,
  });
}
