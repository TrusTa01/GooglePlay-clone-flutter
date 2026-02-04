import 'package:flutter/material.dart';

import '/screens/screens.dart';
import '../../widgets.dart';
import '../../../models/models.dart';

class ProductGrid extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Product> products;
  final int? maxItems;

  const ProductGrid({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.products,
    this.maxItems,
  });

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridLayoutConfig {
  final double viewportFraction;
  final double heightFactor;
  final double cardPadding;

  const _ProductGridLayoutConfig({
    required this.viewportFraction,
    required this.heightFactor,
    required this.cardPadding,
  });
}

class _ProductGridState extends State<ProductGrid> {
  PageController? _pageController;
  double _lastViewportFraction = 0;
  int _currentPage = 0;

  static const List<(int, _ProductGridLayoutConfig)> _breakpoints = [
    (
      0,
      _ProductGridLayoutConfig(
        // < 600: 1 страница
        viewportFraction: 0.92,
        heightFactor: 240,
        cardPadding: 6,
      ),
    ),
    (
      600,
      _ProductGridLayoutConfig(
        // 600-1000: 2 страницы
        viewportFraction: 0.48,
        heightFactor: 250,
        cardPadding: 10,
      ),
    ),
    (
      1000,
      _ProductGridLayoutConfig(
        // > 1000: 3 страницы
        viewportFraction: 0.32,
        heightFactor: 260,
        cardPadding: 12,
      ),
    ),
  ];

  _ProductGridLayoutConfig _getConfig(double width) {
    _ProductGridLayoutConfig config = _breakpoints.first.$2;
    for (final (breakpoint, cfg) in _breakpoints) {
      if (width >= breakpoint) {
        config = cfg;
      } else {
        break;
      }
    }
    return config;
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _updateController(double viewportFraction) {
    if (_pageController == null || _lastViewportFraction != viewportFraction) {
      _pageController?.dispose();
      _lastViewportFraction = viewportFraction;
      _pageController = PageController(
        viewportFraction: viewportFraction,
        initialPage: _currentPage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product grid carousel)');
      return const SizedBox.shrink();
    }

    // Ограничиваем количество продуктов, если задан maxItems
    final displayProducts =
        widget.maxItems != null && widget.maxItems! < widget.products.length
        ? widget.products.sublist(0, widget.maxItems!)
        : widget.products;

    final double maxContentWidth = Constants.sliderMaxContentWidth;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final config = _getConfig(width);
            _updateController(config.viewportFraction);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок и кнопка больше
                ProductSectionHeader(
                  title: widget.title,
                  subtitle: widget.subtitle,
                  padding: Constants.horizontalContentPadding.copyWith(
                    bottom: 5,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryFullListScreen(
                        title: widget.title,
                        products: widget.products,
                      ),
                    ),
                  ),
                  showButton: true,
                ),

                // Слайдер
                SizedBox(
                  height: config.heightFactor,
                  child: PageView.builder(
                    padEnds: false,
                    clipBehavior: Clip.antiAlias,
                    key: PageStorageKey('grid_${widget.title}'),
                    controller: _pageController,
                    onPageChanged: (index) => _currentPage = index,
                    itemCount: (displayProducts.length / 3).ceil(),
                    itemBuilder: (context, pageIndex) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: pageIndex == 0
                              ? Constants.horizontalContentPadding.left
                              : config.cardPadding,
                          right: config.cardPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(3, (index) {
                            final productIndex = pageIndex * 3 + index;
                            // Оборачиваем в Expanded, чтобы каждая карточка занимала ровно 1/3 высоты
                            return Expanded(
                              child: productIndex < displayProducts.length
                                  ? ProductGridCard(
                                      product: displayProducts[productIndex],
                                    )
                                  : const SizedBox.shrink(),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
