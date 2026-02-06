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
      body: CustomScrollView(
        slivers: [
          SimpleSliverAppBar(
            showBackButton: true,
            showLogo: false,
            onLeadingPressed: () => Navigator.pop(context),
            title: const Text(''),
            actions: [
              IconButton(
                onPressed: () {
                  debugPrint('Share event: ${eventBanner.eventId}');
                },
                icon: const Icon(Icons.share_outlined, color: Colors.black),
              ),
            ],
          ),

          SliverToBoxAdapter(child: EventHeroBanner(banner: eventBanner)),

          if (eventBanner.eventDescription != null &&
              eventBanner.eventDescription!.isNotEmpty)
            SliverToBoxAdapter(
              child: EventDescription(text: eventBanner.eventDescription!),
            ),

          SliverList.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return Padding(
                padding: EdgeInsets.only(top: index == 0 ? 10 : 15),
                child: _buildSection(context, section),
              );
            },
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 45)),
        ],
      ),
    );
  }

  // Метод вынесен за пределы build — теперь всё аккуратно
  Widget _buildSection(BuildContext context, HomeSection section) {
    final rawProducts = section.products ?? [];
    final productList = rawProducts.whereType<Product>().toList();

    if (rawProducts.isEmpty) {
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
      default:
        return const SizedBox.shrink();
    }
  }
}
