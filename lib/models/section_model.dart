enum SectionType { banners, carousel, grid }

class HomeSection {
  final SectionType type;
  final String title;
  final List<dynamic> items;

  HomeSection({required this.type, required this.title, required this.items});
}
