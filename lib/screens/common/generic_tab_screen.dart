import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/products_provider.dart';
import '/models/models.dart';
import '../../widgets/widgets.dart';

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
        itemCount: 5, // Показываем 5 скелетонов
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ProductSliderSkeleton(),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.sections.length,
      // Общие отступы для всего списка
      padding: const EdgeInsets.only(bottom: 45),
      itemBuilder: (context, index) {
        final section = widget.sections[index];
        return Padding(
          // Отступ между cекциями
          padding: const EdgeInsets.only(top: 20),
          child: _buildSection(section),
        );
      },
    );
  }

  Widget _buildSection(HomeSection section) {
    final productList = section.products.whereType<Product>().toList();

    if (section.products.isEmpty) {
      return const SizedBox.shrink();
    }

    switch (section.type) {
      case SectionType.banners:
        return BannerSection(
          banners: section.products.whereType<AppBanner>().toList(),
          title: section.title,
          showButton: section.showButton,
        );
      case SectionType.carousel:
        return ProductCarousel(
          title: section.title,
          products: productList,
        );
      case SectionType.grid:
        return ProductGrid(
          title: section.title,
          products: productList,
        );
      case SectionType.preview:
        return GamePreviewSection(
          games: section.products.whereType<Game>().toList(),
        );
    }
  }
}
