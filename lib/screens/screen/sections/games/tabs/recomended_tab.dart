import 'package:flutter/material.dart';
import 'dart:async';

import '/widgets/widgets.dart';
import '/services/product_service_temp.dart';
import '/models/product_interface.dart';

class GamesRecommendedTab extends StatefulWidget {
  const GamesRecommendedTab({super.key});

  @override
  State<GamesRecommendedTab> createState() => _GamesRecommendedTabState();
}

class _GamesRecommendedTabState extends State<GamesRecommendedTab> {
  late final PageController _pageController;
  static const double _viewportFraction = 0.92;
  static const int _initialBannerIndex = 3;

  late Future<List<Product>> _recommendedGamesFuture;
  late final ProductService _productService;

  

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: _viewportFraction,
      initialPage: _initialBannerIndex,
    );
    _productService = ProductService();
    _recommendedGamesFuture = _productService.loadProducts('games.json');
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final thirtyPercentWidth = screenWidth / 3;
    final thirtyPercentHeight = screenHeight / 3;

    return ListView(
      children: [
        // Banners
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: thirtyPercentHeight,
              maxWidth: thirtyPercentWidth,
            ),
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: heroBanners,
            ),
          ),
        ),
        const SizedBox(height: 30,),
        // Recomended slider
        _buildProductSliderFuture(
          title: 'Специально для вас',
          future: _recommendedGamesFuture,
          // Берем элементы со сдвигом (например, с 8 по 15)
          limit: 7,
          offset: 7,
        )
      ],
    );
  }
  Widget _buildProductSliderFuture({
    required String title,
    required Future<List<Product>> future,
    required int limit,
    int offset = 0,
  }) {
    return FutureBuilder<List<Product>>(
      // Передаем Future, запущенный в initState
      future: future, 
      
      builder: (context, snapshot) {
        
        // --- СОСТОЯНИЕ ЗАГРУЗКИ ---
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Пока ждем, показываем загрузочный индикатор
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        // --- СОСТОЯНИЕ ОШИБКИ ---
        if (snapshot.hasError) {
          debugPrint('Ошибка загрузки данных: ${snapshot.error}');
          return Center(child: Text('Ошибка загрузки: ${snapshot.error}'));
        }

        // --- СОСТОЯНИЕ ДАННЫХ ---
        if (snapshot.hasData) {
          final allItems = snapshot.data!;
          
          // Применяем смещение (offset) и ограничение (limit)
          final displayItems = allItems.skip(offset).take(limit).toList();

          if (displayItems.isEmpty) {
            return const SizedBox.shrink(); // Не показываем слайдер, если данных нет
          }

          // Передаем готовый список в ваш ProductSlider
          return ProductSlider(
            title: title,
            items: displayItems,
          );
        }
        
        // По умолчанию ничего не показываем
        return const SizedBox.shrink();
      },
    );
  }
}

