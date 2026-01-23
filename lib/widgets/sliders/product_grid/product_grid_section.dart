import 'package:flutter/material.dart';

import '../../widgets.dart';
import '../../../models/models.dart';

class ProductGrid extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (product grid carousel)');
      return const SizedBox.shrink();
    }

    // Ограничиваем количество продуктов, если задан maxItems
    final displayProducts = maxItems != null && maxItems! < products.length
        ? products.sublist(0, maxItems!)
        : products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и кнопка больше
        ProductSectionHeader(
          title: title,
          subtitle: subtitle,
          padding: EdgeInsets.fromLTRB(22, 0, 22, 10),
          onTap: () {},
          showButton: true,
        ),

        // Слайдер
        SizedBox(
          height: 240,
          child: PageView.builder(
            clipBehavior: Clip.none,
            key: PageStorageKey('grid_$title'),
            controller: PageController(viewportFraction: 0.9),

            itemCount: (displayProducts.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              return Column(
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
              );
            },
          ),
        ),
      ],
    );
  }
}
