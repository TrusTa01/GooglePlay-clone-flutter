enum SectionType { banners, carousel, grid, preview, kidsHeroBanner, ageFIlterSelector}

class HomeSection {
  final SectionType type;
  final String? title;
  final String? subtitle;
  final String? imageAssetPath;
  final List<dynamic>? products;
  final bool showButton;
  final bool needsTopPadding;

  HomeSection({
    required this.type,
    required this.title,
    this.subtitle,
    this.imageAssetPath,
    this.products,
    this.showButton = true, 
    this.needsTopPadding = true,
  });
}
