import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

class ProductGridHorizontal extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductGridHorizontal({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty');
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок и кнопка больше
        ProductSectionTitle(
          title: title,
          padding: EdgeInsets.fromLTRB(22, 0, 22, 10),
          onTap: () {},
        ),

        // Слайдер
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            padEnds: false,
            itemCount: (products.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(3, (index) {
                    final productIndex = pageIndex * 3 + index;
                    if (productIndex >= products.length) return const SizedBox(height: 80);
                    // Оборачиваем в Expanded, чтобы каждая карточка занимала ровно 1/3 высоты
                    return Expanded(
                      child: ProductCardHorizontal(product: products[productIndex]),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
