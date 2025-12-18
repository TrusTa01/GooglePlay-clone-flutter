import 'package:flutter/material.dart';
import 'package:google_play/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';

class GamesRecommendedTab extends StatefulWidget {
  const GamesRecommendedTab({super.key});

  @override
  State<GamesRecommendedTab> createState() => _GamesRecommendedTabState();
}

class _GamesRecommendedTabState extends State<GamesRecommendedTab>
    with AutomaticKeepAliveClientMixin {
  static const double _viewportFraction = 0.92;
  static const int _initialBannerIndex = 2;
  late final PageController _pageController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _initialBannerIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final watchProvider = context.watch<ProductsProvider>();
    final allGames = watchProvider.allProducts; 
    final recommended = (List<Product>.from(
      allGames,
    )..shuffle()).take(7).toList();

    return ListView(
    children: [
      // Баннеры показываем всегда (они не зависят от загрузки json)
      BannerSection(banners: BannerData.banners, controller: _pageController),

      // Рисуем либо скелет, либо сам слайдер
      if (watchProvider.isLoading)
        const ProductSliderSkeleton()
      else if (watchProvider.error != null)
        Center(child: Text('Ошибка: ${watchProvider.error}'))
      else
        ProductSlider(title: 'Рекомендуем для вас', items: recommended),
      ],
    );
  }
}
