class EventHeroBannerUiModel {
  final String imageAssetPath;
  final String title;
  final bool hasTopTooltip;
  final String? topTooltipText;

  const EventHeroBannerUiModel({
    required this.imageAssetPath,
    required this.title,
    this.hasTopTooltip = false,
    this.topTooltipText,
  });
}
