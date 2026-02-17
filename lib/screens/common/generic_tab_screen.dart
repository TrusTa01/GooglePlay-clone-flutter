import 'package:flutter/material.dart';

import 'package:google_play/core/constants.dart';

import 'package:google_play/models/models.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

class GenericTabScreen extends StatefulWidget {
  final List<HomeSection> sections;
  final VoidCallback? onLoad;
  final bool isSliver;
  final String? tabKey; // Для дебага

  const GenericTabScreen({
    super.key,
    required this.sections,
    this.onLoad,
    this.isSliver = false,
    this.tabKey,
  });

  static Widget asSliver({
    required List<HomeSection> sections,
    VoidCallback? onLoad,
  }) {
    return GenericTabScreen(sections: sections, onLoad: onLoad, isSliver: true);
  }

  @override
  State<GenericTabScreen> createState() => _GenericTabScreenState();
}

class _GenericTabScreenState extends State<GenericTabScreen>
    with AutomaticKeepAliveClientMixin {
  // Сохранение состояния прокрутки при переключении табов
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Основной список секций
    if (widget.isSliver) {
      return SliverList.builder(
        itemCount: widget.sections.length,
        itemBuilder: (context, index) =>
            _buildSectionWrapper(index, widget.sections[index]),
      );
    }

    return ListView.builder(
      primary: false,
      itemCount: widget.sections.length,
      itemBuilder: (context, index) =>
          _buildSectionWrapper(index, widget.sections[index]),
    );
  }

  Widget _buildSectionWrapper(int index, HomeSection section) {
    final section = widget.sections[index];

    final prevIsAgeFilter =
        index > 0 &&
        widget.sections[index - 1].type == SectionType.ageFIlterSelector;
    final topPadding = section.needsTopPadding && !prevIsAgeFilter ? 15.0 : 0.0;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: _buildSection(section),
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
    bool needsHorizontalPadding = false;

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
        break;
      case SectionType.carousel:
        sectionWidget = ProductCarousel(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
        );
        break;
      case SectionType.grid:
        sectionWidget = ProductGrid(
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
          products: productList,
        );
        break;
      case SectionType.preview:
        sectionWidget = _KeepAliveSection(
          child: GamePreviewSection(
            game: rawProducts.whereType<Game>().toList(),
            nestedInScrollView: true,
            showButton: section.showButton,
          ),
        );
        break;
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
        break;
      case SectionType.ageFIlterSelector:
        sectionWidget = KidsAgeFilterSelector(
          type: FilterType.kidsAge,
          title: section.title ?? '',
          subtitle: section.subtitle ?? '',
        );
        break;
    }

    if (needsHorizontalPadding) {
      return Padding(
        padding: Constants.horizontalContentPadding,
        child: sectionWidget,
      );
    }
    return sectionWidget;
  }
}

// Обёртка, чтобы секция не пересоздавалась при скролле
class _KeepAliveSection extends StatefulWidget {
  final Widget child;

  const _KeepAliveSection({required this.child});

  @override
  State<_KeepAliveSection> createState() => _KeepAliveSectionState();
}

class _KeepAliveSectionState extends State<_KeepAliveSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
