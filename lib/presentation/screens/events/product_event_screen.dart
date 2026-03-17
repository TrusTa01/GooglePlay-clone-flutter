import 'package:flutter/material.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/banner_item_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/event_hero_banner_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/banner_item_ui_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/event_hero_banner_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

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
    final eventHeroMapper = const EventHeroBannerMapper();
    final EventHeroBannerUiModel heroModel = eventHeroMapper.fromSimpleBanner(
      eventBanner,
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
            SliverToBoxAdapter(child: EventHeroBanner(model: heroModel)),
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
      ),
    );
  }

  // Метод вынесен за пределы build — теперь всё аккуратно
  Widget _buildSection(BuildContext context, HomeSection section) {
    final rawProducts = section.products ?? [];

    if (rawProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    switch (section.type) {
      case SectionType.carousel:
        // TODO: маппинг в ProductCardUiModel и onTap по productId
        return ProductCarousel(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          items: const [],
          onProductTap: (_) {},
          maxItems: 10,
        );
      case SectionType.grid:
        // TODO: маппинг в ActionRowUiModel и onTap по model.id
        return ProductGrid(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          items: const [],
          onProductTap: (_) {},
          maxItems: 15,
        );
      case SectionType.preview:
        // TODO: маппинг в ProductPreviewSection (productIds + screenshots + ActionRowUiModel)
        return ProductPreviewSection(
          productIds: const [],
          screenshotsByProductId: const {},
          actionRowsByProductId: const {},
          nestedInScrollView: true,
        );
      case SectionType.banners:
        final bannerMapper = const BannerItemMapper();
        final bannerEntities = rawProducts
            .whereType<AppBanner>()
            .map((b) => b.toEntity())
            .toList();
        final List<BannerItemUiModel> bannerModels = bannerEntities
            .map(
              (entity) => bannerMapper.fromEntity(
                entity,
                actionRow:
                    null, // ActionRowUiModel можно передать при необходимости
              ),
            )
            .toList();

        return BannerSection(
          banners: bannerModels,
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          showButton: section.showButton,
          maxItems: 8,
          onBannerTap: (banner) {
            // TODO: навигация по banner.productId или обработка события
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
