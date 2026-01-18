enum SectionType { banners, carousel, grid, preview }

class HomeSection {
  final SectionType type;
  final String title;
  final List<dynamic> products;
  final bool showButton;

  HomeSection({
    required this.type,
    required this.title,
    required this.products,
    this.showButton = true,
  });
}
