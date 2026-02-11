import 'package:flutter/material.dart';

import '../../../models/product_models/book_model.dart';
import '../../../models/product_models/product_interface.dart';
import '../../../screens/category/category_full_list_screen.dart';
import '../../widgets.dart';

class ProductCarousel extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Product> products;
  final bool isBookCarousel;
  final int? maxItems;
  final EdgeInsets? contentPadding;

  const ProductCarousel({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.products,
    this.isBookCarousel = false,
    this.maxItems,
    this.contentPadding,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  double _lastFraction = 0.0;
  PageController? _pageController;
  bool _isHovered = false;
  int _currentPage = 0;

  void _updateController(double newFraction) {
    if (_pageController == null || _lastFraction != newFraction) {
      _pageController?.dispose();
      _lastFraction = newFraction;
      _pageController = PageController(viewportFraction: newFraction);
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  // Константы размеров карточек и отступа между ними
  static const double _bookCardWidth = 120;
  static const double _productCardMinWidth = 115;
  static const double _cardSpacing = 11.3;

  /// Количество видимых карточек по брейкпоинтам (3–8).
  static int _visibleCountForWidth(double width) {
    if (width >= Constants.sliderMaxContentWidth) return 8;
    if (width >= 900) return 7;
    if (width >= 768) return 6;
    if (width >= 600) return 5;
    if (width >= 480) return 4;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product carousel)');
      return const SizedBox.shrink();
    }

    final bool isBook = widget.products.first is Book;

    // Базовый минимальный размер карточки (карточки не уменьшаются ниже этого)
    final double baseIconWidth = isBook ? _bookCardWidth : _productCardMinWidth;
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

            // Краевой отступ слева и справа — симметричная «зона»
            final double edgePad = Constants.horizontalContentPadding.left;
            final double effectiveWidth = width - edgePad * 2;

            // По брейкпоинтам — сколько карточек показываем
            final int visibleCount = _visibleCountForWidth(width);
            final int lastItem = (displayProducts.length - visibleCount).clamp(
              0,
              displayProducts.length,
            );
            // Слот на одну карточку: делим ширину поровну; карточка заполняет слот минус отступ
            final double slotWidth = effectiveWidth / visibleCount;
            double cardWidth = (slotWidth - _cardSpacing).clamp(
              baseIconWidth,
              double.infinity,
            );
            // Доля ширины на одну карточку (карточка + отступ)
            final double fraction = (cardWidth + _cardSpacing) / effectiveWidth;
            _updateController(fraction.clamp(0.0, 1.0));

            final double iconWidth = cardWidth;
            final double iconHeight = isBook ? iconWidth * 1.5 : iconWidth;
            final double sliderHeight = iconHeight + 70;

            final mobilePadding = width > 1000
                ? EdgeInsets.only(left: 22 + arrowSpace)
                : Constants.horizontalContentPadding;

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
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: SizedBox(
                    height: sliderHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: arrowSpace,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: edgePad),
                            child: SizedBox(
                              height: sliderHeight,
                              child: PageView.builder(
                                padEnds: false,
                                clipBehavior: Clip.antiAlias,
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
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
                                      right: isLast ? 0 : _cardSpacing,
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
                        // Кнопки внутри Stack — в пределах его границ, hit-test работает
                        if (_isHovered) ...[
                          if (_currentPage > 0)
                            ScrollButton(
                              isLeft: true,
                              offset: contentWidth >= 1040 ? 20 : 10,
                              alignment: const Alignment(0, -0.45),
                              onPressed: () => _pageController?.animateToPage(
                                (_currentPage - visibleCount).clamp(0, displayProducts.length - 1),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.decelerate,
                              ),
                            ),
                          if (_currentPage < lastItem)
                            ScrollButton(
                              isLeft: false,
                              offset: contentWidth >= 1040 ? -20 : 5,
                              alignment: const Alignment(0, -0.45),
                              onPressed: () => _pageController?.animateToPage(
                                (_currentPage + visibleCount).clamp(0, lastItem),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.decelerate,
                              ),
                            ),
                        ],
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
