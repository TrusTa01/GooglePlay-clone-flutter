import 'package:flutter/material.dart';

import '/models/models.dart';
import '../../widgets/widgets.dart';

class GenericTabScreen extends StatefulWidget {
  final List<HomeSection> sections;

  const GenericTabScreen({super.key, required this.sections});

  @override
  State<GenericTabScreen> createState() => _GenericTabScreenState();
}

class _GenericTabScreenState extends State<GenericTabScreen>
    with AutomaticKeepAliveClientMixin {
  // Сохранение состояния табов при переключении
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: widget.sections.length,
      // Общие отступы для всего списка
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) {
        final section = widget.sections[index];
        return Padding(
          // Отступ между мекциями
          padding: const EdgeInsets.only(bottom: 25.0),
          child: _buildSection(section),
        );
      },
    );
  }

  Widget _buildSection(HomeSection section) {
    switch (section.type) {
      case SectionType.carousel:
        return ProductCarousel(
          title: section.title,
          products: section.items.cast<Product>(),
        );
      case SectionType.grid:
        return ProductGrid(
          title: section.title,
          products: section.items.cast<Product>(),
        );
      case SectionType.banners:
        return BannerSection(banners: section.items.cast<BannerData>());
    }
  }
}
