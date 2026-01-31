import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/products_provider.dart';
import '/models/models.dart';
import '../../widgets/widgets.dart';
import '/screens/screens.dart';

class GenericTabScreen extends StatefulWidget {
  final List<HomeSection> sections;
  final VoidCallback? onLoad;

  const GenericTabScreen({super.key, required this.sections, this.onLoad});

  @override
  State<GenericTabScreen> createState() => _GenericTabScreenState();
}

class _GenericTabScreenState extends State<GenericTabScreen>
    with AutomaticKeepAliveClientMixin {
  // Сохранение состояния табов при переключении
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onLoad != null) {
        widget.onLoad!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final watchProvider = context.watch<ProductsProvider>();

    // Если данных нет и идет загрузка — показываем шиммеры
    if (watchProvider.isLoading && widget.sections.isEmpty) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ProductSliderSkeleton(),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.sections.length,
      padding: const EdgeInsets.only(bottom: 45),
      itemBuilder: (context, index) {
        final section = widget.sections[index];
        return Padding(
          padding: EdgeInsets.only(top: section.needsTopPadding ? 15 : 0),
          child: _buildSection(section),
        );
      },
    );
  }

  Widget _buildSection(HomeSection section) {
    final rawProducts = section.products ?? [];
    final productList = rawProducts.whereType<Product>().toList();

    if (section.type != SectionType.kidsHeroBanner &&
        section.type != SectionType.ageFIlterSelector &&
        rawProducts.isEmpty) {
      debugPrint(
        'Error: section.products.isEmpty. Section ${section.title} is empty and skipped (generic_tab_screen.dart)',
      );
      return const SizedBox.shrink();
    }

    Widget sectionWidget;
    bool needsHorizontalPadding = true;

    switch (section.type) {
      case SectionType.banners:
        needsHorizontalPadding = false;
        sectionWidget = BannerSection(
          banners: rawProducts.whereType<AppBanner>().toList(),
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          showButton: section.showButton,
          maxItems: 8,
        );
      case SectionType.carousel:
        sectionWidget = ProductCarousel(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
          maxItems: 10,
        );
      case SectionType.grid:
        sectionWidget = ProductGrid(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
          maxItems: 15,
        );
      case SectionType.preview:
        sectionWidget = GamePreviewSection(
          game: rawProducts.whereType<Game>().toList(),
          nestedInScrollView: true,
        );
      case SectionType.kidsHeroBanner:
        needsHorizontalPadding = false;
        sectionWidget = KidsHeroBanner(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          imageAssetPath: section.imageAssetPath ?? '',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const KidsDetailsScreen(),
              ),
            );
          },
        );
      case SectionType.ageFIlterSelector:
        sectionWidget = KidsAgeFilterSelector(
          type: FilterType.kidsAge,
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
        );
    }

    if (needsHorizontalPadding) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.screenHorizontalPadding,
        ),
        child: sectionWidget,
      );
    }
    return sectionWidget;
  }
}
