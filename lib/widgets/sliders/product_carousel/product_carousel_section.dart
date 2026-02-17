import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/models/product_models/book_model.dart';
import 'package:google_play/models/product_models/product_interface.dart';
import 'package:google_play/screens/category/category_full_list_screen.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/widgets/sliders/product_carousel/utils/carousel_layout.dart';

class ProductCarousel extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Product> products;
  final bool isBookCarousel;
  final int? maxItems;
  final double leftPadding;
  final bool needsRightPadding;

  const ProductCarousel({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.products,
    this.isBookCarousel = false,
    this.maxItems,
    this.leftPadding = 22,
    this.needsRightPadding = true,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  double _lastFraction = 0.0;
  PageController? _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  void _updateController(double newFraction) {
    if (_pageController == null || _lastFraction != newFraction) {
      _pageController?.dispose();
      _lastFraction = newFraction;
      _pageController = PageController(
        viewportFraction: newFraction,
        initialPage: _currentPage.value,
      );
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _currentPage.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product carousel)');
      return const SizedBox.shrink();
    }

    final bool isBook = widget.products.first is Book;
    final double baseIconWidth = isBook
        ? carouselBookCardWidth
        : carouselProductCardMinWidth;
    final int cacheWidth = isBook ? 300 : 216;
    final int cacheHeight = isBook ? 350 : 216;

    // Ограничиваем количество продуктов, если задан maxItems
    final displayProducts =
        widget.maxItems != null && widget.maxItems! < widget.products.length
        ? widget.products.sublist(0, widget.maxItems!)
        : widget.products;

    final double maxContentWidth = Constants.sliderMaxContentWidth;

    final viewportWidth = MediaQuery.sizeOf(context).width;
    final contentWidth = viewportWidth.clamp(0.0, maxContentWidth);

    final double arrowSpace = ((viewportWidth - maxContentWidth) / 2).clamp(
      0.0,
      25,
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth + arrowSpace * 2),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = contentWidth.clamp(0.0, constraints.maxWidth);
            // На странице продукта контент уже в ConstrainedBox(1040) — не сдвигаем карусель
            final double effectiveArrowSpace =
                constraints.maxWidth > maxContentWidth ? arrowSpace : 0.0;

            // Краевой отступ слева и справа — симметричная «зона»
            final double edgePad = Constants.horizontalContentPadding.left;
            // Полную ширину контента (1040) подставляем только когда контейнер "почти полный"
            // (страница продукта с padding ≈ 996px). На маленьких экранах используем реальную ширину.
            final double layoutWidth =
                (constraints.maxWidth <= maxContentWidth &&
                    constraints.maxWidth >= maxContentWidth - edgePad * 2)
                ? maxContentWidth
                : width;
            final double effectiveWidth = layoutWidth - edgePad * 2;

            final int visibleCount = carouselVisibleCountForWidth(
              layoutWidth,
            ).clamp(1, displayProducts.length);
            final int lastItem = (displayProducts.length - visibleCount).clamp(
              0,
              displayProducts.length,
            );
            final double carouselCardSpacing = width < 700 ? 5 : 11;
            final double slotWidth = effectiveWidth / visibleCount;
            double cardWidth = (slotWidth - carouselCardSpacing).clamp(
              baseIconWidth,
              double.infinity,
            );
            final double fraction =
                (cardWidth + carouselCardSpacing) / effectiveWidth;
            _updateController(fraction.clamp(0.0, 1.0));

            final double iconWidth = cardWidth;
            final double iconHeight = isBook ? iconWidth * 1.5 : iconWidth;
            final double sliderHeight = iconHeight + 70;

            final EdgeInsets mobilePadding = EdgeInsets.only(
              left: widget.leftPadding + effectiveArrowSpace,
              right: widget.needsRightPadding
                  ? (layoutWidth >= 1040 ? 0 : 22)
                  : 0,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок и кнопка больше
                Padding(
                  padding: mobilePadding,
                  child: ProductSectionHeader(
                    title: widget.title,
                    subtitle: widget.subtitle,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
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

                MouseRegion(
                  onEnter: (_) => _isHovered.value = true,
                  onExit: (_) => _isHovered.value = false,
                  child: SizedBox(
                    height: sliderHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: effectiveArrowSpace,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: widget.leftPadding),
                            child: SizedBox(
                              height: sliderHeight,
                              child: PageView.builder(
                                padEnds: false,
                                clipBehavior: Clip.antiAlias,
                                controller: _pageController,
                                onPageChanged: (index) =>
                                    _currentPage.value = index,
                                key: PageStorageKey('carousel_${widget.title}'),
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: displayProducts.length,
                                itemBuilder: (context, index) {
                                  final item = displayProducts[index];
                                  final bool isLast =
                                      index == displayProducts.length - 1;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      right: isLast ? 0 : carouselCardSpacing,
                                    ),
                                    child: ProductCarouselCard(
                                      product: item,
                                      iconWidth: iconWidth,
                                      iconHeight: iconHeight,
                                      cacheWidth: cacheWidth,
                                      cacheHeight: cacheHeight,
                                    ),
                                  );
                                },
                              ),
                            ),
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
                                      offset: effectiveArrowSpace >= 1
                                          ? 20
                                          : 10,
                                      alignment: const Alignment(0, -0.45),
                                      onPressed: () =>
                                          _pageController?.animateToPage(
                                            (_currentPage.value - visibleCount)
                                                .clamp(
                                                  0,
                                                  displayProducts.length - 1,
                                                ),
                                            duration: const Duration(
                                              milliseconds: 800,
                                            ),
                                            curve: Curves.decelerate,
                                          ),
                                    ),
                                  if (_currentPage.value < lastItem)
                                    ScrollButton(
                                      isLeft: false,
                                      offset: effectiveArrowSpace >= 1
                                          ? -20
                                          : 5,
                                      alignment: const Alignment(0, -0.45),
                                      onPressed: () =>
                                          _pageController?.animateToPage(
                                            (_currentPage.value + visibleCount)
                                                .clamp(0, lastItem),
                                            duration: const Duration(
                                              milliseconds: 800,
                                            ),
                                            curve: Curves.decelerate,
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
