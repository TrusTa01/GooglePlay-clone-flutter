import 'package:flutter/material.dart';

import 'package:google_play/providers/products_provider.dart';
import 'package:provider/provider.dart';
import '/widgets/widgets.dart';

class GamesRecommendedTab extends StatefulWidget {
  const GamesRecommendedTab({super.key});

  @override
  State<GamesRecommendedTab> createState() => _GamesRecommendedTabState();
}

class _GamesRecommendedTabState extends State<GamesRecommendedTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final watchProvider = context.watch<ProductsProvider>();

    if (watchProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final recommended = watchProvider.recommendedGames;
    final fightGames = watchProvider.getGamesByCategory('Файтинг');
    final survivalGames = watchProvider.getGamesByCategory('Выживание');

    return ListView(
      children: [
        BannerSection(banners: BannerData.banners),
        const SizedBox(height: 20),

        // Рисуем либо скелет, либо сам слайдер
        if (watchProvider.isLoading)
          const ProductSliderSkeleton()
        else if (watchProvider.error != null)
          Center(child: Text('Ошибка: ${watchProvider.error}'))
        else
          ProductSlider(title: 'Рекомендуем для вас', products: recommended),
        const SizedBox(height: 15),

        ProductGridHorizontal(title: 'Файтинг', products: fightGames),
        const SizedBox(height: 15),

        ProductGridHorizontal(title: 'Выживание', products: survivalGames),
        const SizedBox(height: 15),

        BannerSection(banners: BannerData.banners),
        const SizedBox(height: 20),

        ProductGridHorizontal(title: 'Выживание', products: survivalGames),
        const SizedBox(height: 15),

        ProductSlider(title: 'Рекомендуем для вас', products: recommended),
        const SizedBox(height: 15),

        BannerSection(banners: BannerData.banners),
        const SizedBox(height: 20),

        ProductGridHorizontal(title: 'Выживание', products: survivalGames),
        const SizedBox(height: 15),

        ProductSlider(title: 'Рекомендуем для вас', products: recommended),
        const SizedBox(height: 15),

        ProductGridHorizontal(title: 'Выживание', products: survivalGames),
        const SizedBox(height: 15),
      ],
    );
  }
}
