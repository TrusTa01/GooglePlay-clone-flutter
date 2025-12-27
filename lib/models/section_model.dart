enum SectionType { banners, carousel, grid, preview, categotyList }

class HomeSection {
  final SectionType type;
  final String title;
  final List<dynamic> items;
  final bool showButton;

  HomeSection({
    required this.type,
    required this.title,
    required this.items,
    this.showButton = true,
  });
}
