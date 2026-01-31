import 'package:flutter/material.dart';

import '/models/models.dart';
import '../../widgets/widgets.dart';

class ProductEventScreen extends StatelessWidget {
  final SimpleBanner eventBanner;
  final List<HomeSection> sections;

  const ProductEventScreen({
    super.key,
    required this.eventBanner,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        type: AppBarType.transparent,
        showBackButton: true,
        title: const Text(''),
        onLeadingPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Share event: ${eventBanner.eventId}');
            },
            icon: const Icon(Icons.share_outlined, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          EventHeroBanner(banner: eventBanner),
          if (eventBanner.eventDescription != null &&
              eventBanner.eventDescription!.isNotEmpty)
            EventDescription(text: eventBanner.eventDescription!),
          ...sections.asMap().entries.map((entry) {
            final index = entry.key;
            final section = entry.value;
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 10 : 15),
              child: _buildSection(context, section),
            );
          }),

          // Bottom padding
          const SizedBox(height: 45),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, HomeSection section) {
    final rawProducts = section.products ?? [];
    final productList = rawProducts.whereType<Product>().toList();

    if (rawProducts.isEmpty) {
      debugPrint(
        'Error: section.products.isEmpty. Section ${section.title} is empty and skipped (product_event_screen.dart)',
      );
      return const SizedBox.shrink();
    }

    switch (section.type) {
      case SectionType.carousel:
        return ProductCarousel(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
          maxItems: 10,
        );
      case SectionType.grid:
        return ProductGrid(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
          maxItems: 15,
        );
      case SectionType.preview:
        return GamePreviewSection(
          game: rawProducts.whereType<Game>().toList(),
          nestedInScrollView: true,
        );
      case SectionType.banners:
        return BannerSection(
          banners: rawProducts.whereType<AppBanner>().toList(),
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          showButton: section.showButton,
          maxItems: 8,
        );
      case SectionType.kidsHeroBanner:
      case SectionType.ageFIlterSelector:
        return const SizedBox.shrink();
    }
  }
}
