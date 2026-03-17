import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_card_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/widgets/sliders/product_carousel/utils/carousel_layout.dart';

class ProductCarousel extends HookWidget {
  final String title;
  final String subtitle;
  final List<ProductCardUiModel> items;
  final bool isBookCarousel;
  final int? maxItems;
  final double leftPadding;
  final bool needsRightPadding;
  final ValueChanged<ProductCardUiModel> onProductTap;

  const ProductCarousel({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.items,
    this.isBookCarousel = false,
    this.maxItems,
    this.leftPadding = 22,
    this.needsRightPadding = true,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    // Состояния
    final currentPage = useState(0);
    final isHovered = useState(false);

    // Базовые расчеты геометрии
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final maxContentWidth = Constants.sliderMaxContentWidth;
    final contentWidth = viewportWidth.clamp(0.0, maxContentWidth);

    // Определяем типы данных
    final bool isBook = isBookCarousel;
    final double baseIconWidth = isBook
        ? carouselBookCardWidth
        : carouselProductCardMinWidth;

    // Ограничение списка
    final displayProducts = maxItems != null && maxItems! < items.length
        ? items.sublist(0, maxItems!)
        : items;

    // Расчет отступов и фракции (перенесено из LayoutBuilder)
    final double arrowSpace = ((viewportWidth - maxContentWidth) / 2).clamp(
      0.0,
      25.0,
    );
    final double edgePad = Constants.horizontalContentPadding.left;
    final double effectiveWidth = contentWidth - edgePad * 2;

    final int visibleCount = carouselVisibleCountForWidth(
      contentWidth,
    ).clamp(1, displayProducts.length);
    final double carouselCardSpacing = contentWidth < 700 ? 5 : 11;
    final double slotWidth = effectiveWidth / visibleCount;
    final double cardWidth = (slotWidth - carouselCardSpacing).clamp(
      baseIconWidth,
      double.infinity,
    );
    final double effectiveArrowSpace = viewportWidth > maxContentWidth
        ? arrowSpace
        : 0.0;

    final double fraction = ((cardWidth + carouselCardSpacing) / effectiveWidth)
        .clamp(0.0, 1.0);

    // Контроллер
    final pageController = useMemoized(
      () => PageController(
        viewportFraction: fraction,
        initialPage: currentPage.value,
      ),
      [fraction],
    );
    useEffect(() => pageController.dispose, [pageController]);

    // Высота и прочие UI параметры
    final double iconHeight = isBook ? cardWidth * 1.5 : cardWidth;
    final double sliderHeight = iconHeight + 70;
    final int lastItem = (displayProducts.length - visibleCount).clamp(
      0,
      displayProducts.length,
    );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth + arrowSpace * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок и кнопка "Ещё"
            Padding(
              padding: EdgeInsets.only(
                left: leftPadding + arrowSpace,
                right: needsRightPadding ? (contentWidth >= 1040 ? 0 : 22) : 0,
              ),
              child: ProductSectionHeader(
                title: title,
                subtitle: subtitle,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                onTap: () {},
                showButton: true,
              ),
            ),

            MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
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
                        padding: EdgeInsets.only(left: leftPadding),
                        child: SizedBox(
                          height: sliderHeight,
                          child: PageView.builder(
                            padEnds: false,
                            clipBehavior: Clip.antiAlias,
                            controller: pageController,
                            onPageChanged: (index) => currentPage.value = index,
                            key: PageStorageKey('carousel_$title'),
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
                                  key: ValueKey(item.id),
                                  model: item,
                                  onTap: () => onProductTap(item),
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
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          if (currentPage.value > 0)
                            ScrollButton(
                              isLeft: true,
                              offset: effectiveArrowSpace >= 1 ? 20 : 10,
                              alignment: const Alignment(0, -0.45),
                              onPressed: () => pageController.animateToPage(
                                (currentPage.value - visibleCount).clamp(
                                  0,
                                  displayProducts.length - 1,
                                ),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.decelerate,
                              ),
                            ),
                          if (currentPage.value < lastItem)
                            ScrollButton(
                              isLeft: false,
                              offset: effectiveArrowSpace >= 1 ? -20 : 5,
                              alignment: const Alignment(0, -0.45),
                              onPressed: () => pageController.animateToPage(
                                (currentPage.value + visibleCount).clamp(
                                  0,
                                  lastItem,
                                ),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.decelerate,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
