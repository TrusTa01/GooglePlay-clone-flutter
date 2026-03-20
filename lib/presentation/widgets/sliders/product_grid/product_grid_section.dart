import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/widgets/sliders/product_grid/utils/grid_layout_config.dart';

class ProductGrid extends HookWidget {
  final String title;
  final String subtitle;
  final List<ActionRowUiModel> items;
  final int? maxItems;
  final ValueChanged<ActionRowUiModel> onProductTap;
  final VoidCallback? onSeeAllTap;

  const ProductGrid({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.items,
    this.maxItems,
    required this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    // Состояния
    final currentPage = useState(0);
    final isHovered = useState(false);

    // Адаптивность
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final maxContentWidth = Constants.sliderMaxContentWidth;
    final contentWidth = viewportWidth.clamp(0.0, maxContentWidth);
    final config = productGridAdaptiveConfig(contentWidth);

    // Контроллер
    final pageController = useMemoized(
      () => PageController(
        viewportFraction: config.viewportFraction,
        initialPage: currentPage.value,
      ),
      [config.viewportFraction],
    );

    // Авто-dispose
    useEffect(() => pageController.dispose, [pageController]);

    if (items.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product grid carousel)');
      return const SizedBox.shrink();
    }

    // Расчеты для пагинации
    final displayProducts = maxItems != null && maxItems! < items.length
        ? items.sublist(0, maxItems!)
        : items;

    final totalPages = (displayProducts.length / 3).ceil();
    final visibleFullPages = (1 / config.viewportFraction).floor();
    final lastItem = (totalPages - visibleFullPages).clamp(0, totalPages);
    final bufferPages = (1 / config.viewportFraction).ceil() - visibleFullPages;
    final double arrowSpace = ((viewportWidth - maxContentWidth) / 2).clamp(
      0.0,
      25.0,
    );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth + arrowSpace * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: contentWidth >= 1040
                  ? EdgeInsets.only(left: 22 + arrowSpace)
                  : Constants.horizontalContentPadding,
              child: ProductSectionHeader(
                title: title,
                subtitle: subtitle,
                showButton: true,
                padding: const EdgeInsets.only(bottom: 5),
                onTap: onSeeAllTap ?? () {},
              ),
            ),

            // MouseRegion снаружи Stack — не блокирует кнопки внутри
            MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
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
                        key: PageStorageKey('grid_$title'),
                        controller: pageController,
                        onPageChanged: (index) => currentPage.value = index,
                        itemCount: totalPages + bufferPages,
                        itemBuilder: (context, pageIndex) {
                          if (pageIndex >= totalPages) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: Constants.horizontalContentPadding.left,
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
                                  child: productIndex < displayProducts.length
                                      ? ProductGridCard(
                                          key: ValueKey(
                                            displayProducts[productIndex].id,
                                          ),
                                          model: displayProducts[productIndex],
                                          onProductTap: () => onProductTap(
                                            displayProducts[productIndex],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),

                    // Кнопки внутри Stack — в пределах его границ, hit-test работает
                    // Positioned.fill чтобы не участвовать в расчёте размера Stack (иначе Stack схлопывается)
                    Positioned.fill(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          if (currentPage.value > 0)
                            ScrollButton(
                              isLeft: true,
                              offset: contentWidth >= 1040 ? 20 : 25,
                              onPressed: () => pageController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                            ),
                          if (currentPage.value < lastItem)
                            ScrollButton(
                              isLeft: false,
                              offset: contentWidth >= 1040 ? -15 : 5,
                              onPressed: () => pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
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
