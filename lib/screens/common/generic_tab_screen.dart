import 'package:flutter/material.dart';

import 'package:google_play/core/constants.dart';

import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

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

  Widget _buildSection(ResolvedSection section) {
    // if (section.type != SectionType.kidsHeroBanner &&
    //     section.type != SectionType.ageFIlterSelector &&
    //     rawProducts.isEmpty) {
    //   debugPrint(
    //     'Error: section.products.isEmpty. Section ${section.title} is empty and skipped (generic_tab_screen.dart)',
    //   );
    //   return const SizedBox.shrink();
    // }

    return switch (section.config.layout) {
      SectionLayoutKind.carousel => ProductCarousel(
        title: section.config.titleKey,
        items: section.items as List<ProductEntity>,
      ),
      SectionLayoutKind.grid => ProductGrid(
        items: section.items as List<ProductEntity>,
      ),
      SectionLayoutKind.banners => BannerSection(
        banners: section.items as List<BannerEntity>,
      ),
      _ => const SizedBox.shrink(),
    };
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
