import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/widgets/widgets.dart';

class TopChartsPage extends StatelessWidget {
  final FilterType type;

  const TopChartsPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductsProvider>();
    final items = provider.getFilteredProducts(type);

    return Column(
      children: [
        FilterSets.getFilters(type, provider), // Фильтры

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    Text('${index + 1}', style: const TextStyle(fontSize: 14)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ActionRow(
                        product: item,
                        showGenre: true,
                        showButton: false,
                        iconWidth: 60,
                        iconHeight: 60,
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
