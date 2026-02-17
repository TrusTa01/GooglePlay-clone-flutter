import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/widgets/sliders/product_grid/utils/grid_layout_config.dart';

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

class _ProductGridState extends State<ProductGrid> {
  PageController? _pageController;
  double _lastViewportFraction = 0;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _pageController?.dispose();
    _currentPage.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  void _updateController(double viewportFraction) {
    if (_pageController == null || _lastViewportFraction != viewportFraction) {
      _pageController?.dispose();
      _lastViewportFraction = viewportFraction;
      _pageController = PageController(
        viewportFraction: viewportFraction,
        initialPage: _currentPage.value,
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

    final viewportWidth = MediaQuery.sizeOf(context).width;
    final contentWidth = viewportWidth.clamp(0.0, maxContentWidth);
    // Считаем место под кнопки-стрелки

    final double arrowSpace = ((viewportWidth - maxContentWidth) / 2).clamp(
      0.0,
      25,
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth + arrowSpace * 2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = contentWidth.clamp(0.0, constraints.maxWidth);
            final config = productGridAdaptiveConfig(width);
            _updateController(config.viewportFraction);
            final mobilePadding = width >= 1040
                ? EdgeInsets.only(left: 22 + arrowSpace)
                : Constants.horizontalContentPadding;
            final totalPages = (displayProducts.length / 3).ceil();
            final visibleFullPages = (1 / config.viewportFraction).floor();
            final bufferPages =
                (1 / config.viewportFraction).ceil() - visibleFullPages;
            final lastItem = (totalPages - visibleFullPages).clamp(
              0,
              totalPages,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: mobilePadding,
                  child: ProductSectionHeader(
                    title: widget.title,
                    subtitle: widget.subtitle,
                    padding: const EdgeInsets.only(bottom: 5),
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
                ),

                // MouseRegion снаружи Stack — не блокирует кнопки внутри
                MouseRegion(
                  onEnter: (_) => _isHovered.value = true,
                  onExit: (_) => _isHovered.value = false,
                  child: SizedBox(
                    height: config.heightFactor,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // PageView по центру — отступы arrowSpace оставляют место для кнопок
                        Positioned(
                          left: arrowSpace,
                          right: arrowSpace,
                          top: 0,
                          bottom: 0,
                          child: PageView.builder(
                            padEnds: false,
                            clipBehavior: Clip.antiAlias,
                            key: PageStorageKey('grid_${widget.title}'),
                            controller: _pageController,
                            onPageChanged: (index) =>
                                _currentPage.value = index,
                            itemCount: totalPages + bufferPages,
                            itemBuilder: (context, pageIndex) {
                              if (pageIndex >= totalPages) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        Constants.horizontalContentPadding.left,
                                  ),
                                  child: const SizedBox.shrink(),
                                );
                              }
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: Constants.horizontalContentPadding.left,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(3, (index) {
                                    final productIndex = pageIndex * 3 + index;
                                    return Expanded(
                                      child:
                                          productIndex < displayProducts.length
                                          ? ProductGridCard(
                                              product:
                                                  displayProducts[productIndex],
                                            )
                                          : const SizedBox.shrink(),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),

                        // Кнопки внутри Stack — в пределах его границ, hit-test работает.
                        // Positioned.fill чтобы не участвовать в расчёте размера Stack (иначе Stack схлопывается).
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: Listenable.merge([
                              _isHovered,
                              _currentPage,
                            ]),
                            builder: (context, _) {
                              if (!_isHovered.value) {
                                return const SizedBox.shrink();
                              }
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  if (_currentPage.value > 0)
                                    ScrollButton(
                                      isLeft: true,
                                      offset: contentWidth >= 1040 ? 20 : 25,
                                      onPressed: () =>
                                          _pageController?.previousPage(
                                            duration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            curve: Curves.easeInOut,
                                          ),
                                    ),
                                  if (_currentPage.value < lastItem)
                                    ScrollButton(
                                      isLeft: false,
                                      offset: contentWidth >= 1040 ? -15 : 5,
                                      onPressed: () =>
                                          _pageController?.nextPage(
                                            duration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            curve: Curves.easeInOut,
                                          ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
