enum SectionType { carousel, grid, banners }

class HomeSection {
  final SectionType type;
  final String title;
  final List<dynamic> items;

  HomeSection({required this.type, required this.title, required this.items});
}
