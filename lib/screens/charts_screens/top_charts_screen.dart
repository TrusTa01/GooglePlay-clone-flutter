import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/constants/global_constants.dart';
import '/providers/providers.dart';
import '/services/product_query_service.dart';
import '/widgets/widgets.dart';

class TopChartsScreen extends StatelessWidget {
  final FilterType type;
  final bool showFilters;

  const TopChartsScreen({
    super.key,
    required this.type,
    this.showFilters = true,
  });

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<ProductsProvider>();
    final filterProvider = context.watch<FilterProvider>();
    final queryService = ProductQueryService();

    // Используем ProductQueryService для фильтрации
    final items = queryService.getFilteredProducts(
      productsProvider.allProducts,
      type: type,
      selectedTopFilter: filterProvider.selectedTopFilter,
      selectedGameCategory: filterProvider.selectedGameCategory,
      selectedAppCategory: filterProvider.selectedAppCategory,
      selectedBookCategory: filterProvider.selectedBookGenre,
      isFilterOnlyMode: filterProvider.isFilterOnlyMode,
      // Фильтры для книг
      selectedAgeFilter: type == FilterType.books
          ? filterProvider.selectedAgeFilter
          : null,
      selectedRatingFilter: type == FilterType.books
          ? filterProvider.selectedRatingFilter
          : null,
      selectedLanguageFilter: type == FilterType.books
          ? filterProvider.selectedLanguageFilter
          : null,
      selectedAbridgedVersionFilter: type == FilterType.books
          ? filterProvider.selectedAbridgetVersionFilter
          : null,
      getMinRatingFromFilter: type == FilterType.books
          ? filterProvider.getMinRatingFromFilter
          : null,
    );

    return CustomScrollView(
      slivers: [
        if (showFilters)
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Constants.sliderMaxContentWidth,
                ),
                child: Padding(
                  padding: Constants.horizontalContentPadding.copyWith(
                    top: 5,
                    bottom: 15,
                  ),
                  child: FilterSets.getFilters(type, filterProvider),
                ),
              ),
            ),
          ),
        SliverLayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.crossAxisExtent;
            final double maxWidth = Constants.sliderMaxContentWidth;

            // Вычисляем горизонтальный отступ для центрирования
            final double horizontalPadding =
                width > maxWidth ? (width - maxWidth) / 2 : 0;

            const double minItemWidth = 350;
            // Считаем количество колонок исходя из доступной ширины внутри ограничений
            final double effectiveWidth = width > maxWidth ? maxWidth : width;
            int crossAxisCount = (effectiveWidth / minItemWidth).floor();
            crossAxisCount = crossAxisCount.clamp(1, 3);

            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding)
                  .add(const EdgeInsets.only(bottom: 45)),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: 90,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => TopChartsCard(
                    product: items[index],
                    rank: index + 1,
                  ),
                  childCount: items.length,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
