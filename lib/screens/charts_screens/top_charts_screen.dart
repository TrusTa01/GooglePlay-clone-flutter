import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/services/product_query_service.dart';
import '/widgets/widgets.dart';

class TopChartsPage extends StatelessWidget {
  final FilterType type;

  const TopChartsPage({super.key, required this.type});

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
      selectedBookCategory: filterProvider.selectedBookCategory,
      isRecentFilterActive: filterProvider.isRecentFilterActive,
    );

    return Column(
      children: [
        FilterSets.getFilters(type, filterProvider), // Фильтры

        Expanded(
          child: ListView.builder(
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
                  children: [
                    Text('${index + 1}', style: const TextStyle(fontSize: 14)),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ActionRow(
                        product: item,
                        hasThreeLines: true,
                        showButton: false,
                        iconWidth: 65,
                        iconHeight: 65,
                        cacheHeight: 190,
                        cacheWidth: 190,
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
