import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/screens/screens.dart';
import '/services/product_query_service.dart';
import '/widgets/widgets.dart';
import '/models/product_models/book_model.dart';

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

    return Column(
      children: [
        if (showFilters) FilterSets.getFilters(type, filterProvider),

        Expanded(
          child: ListView.builder(
            primary: false,
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        '${index + 1}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPageScreen(productId: item.id),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: ActionRow(
                          product: item,
                          hasThreeLines: true,
                          showButton: false,
                          iconWidth: item is Book ? 60 : 65,
                          iconHeight: item is Book ? 90 : 65,
                          cacheWidth: item is Book ? 180 : 190,
                          cacheHeight: item is Book ? 270 : 190,
                          borderRadius: item is Book
                              ? BorderRadius.circular(6)
                              : BorderRadius.circular(12),
                          fit: item is Book ? BoxFit.fill : BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
