import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_play/core/constants.dart';

import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class GenericTabScreen extends HookWidget {
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
  Widget build(BuildContext context) {
    // Сохранение состояния прокрутки при переключении табов
    useAutomaticKeepAlive();

    // Основной список секций
    if (isSliver) {
      return SliverList.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) =>
            _buildSectionWrapper(index, sections[index]),
      );
    }

    return ListView.builder(
      primary: false,
      itemCount: sections.length,
      itemBuilder: (context, index) =>
          _buildSectionWrapper(index, sections[index]),
    );
  }

  Widget _buildSectionWrapper(int index, HomeSection section) {
    final section = sections[index];

    final prevIsAgeFilter =
        index > 0 && sections[index - 1].type == SectionType.ageFIlterSelector;
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
