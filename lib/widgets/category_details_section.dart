import 'package:flutter/material.dart';

import 'widgets.dart';
import '../../models/models.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<Product> products;

  const CategoryDetailsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final bool isBook = products.first is Book;
    final double minItemWidth = isBook ? 100 : 125;
    // Высота текстовой части: SizedBox(6) + Title 2 строки (~36) + SizedBox(4) + Rating(~18) + запас
    const double textAreaHeight = 68;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Сначала вычисляем количество колонок
        final int crossAxisCount = ((constraints.maxWidth - 30) / minItemWidth)
            .floor()
            .clamp(2, 15);

        // Фиксированные отступы
        final double horizontalPadding = 16;
        final double availableWidth =
            constraints.maxWidth - (horizontalPadding * 2);
        final double totalSpacing = (crossAxisCount - 1) * 10;

        // Вычисляем реальную ширину элемента
        final double itemWidth =
            (availableWidth - totalSpacing) / crossAxisCount;

        // Динамически вычисляем высоту: иконка + текстовая часть
        // Книги: соотношение 2:3 (height = width * 1.5)
        // Приложения: соотношение 1:1
        final double iconHeight = isBook ? itemWidth * 1.5 : itemWidth;
        final double itemHeight = iconHeight + textAreaHeight;

        // Вычисляем aspectRatio
        final double aspectRatio = itemWidth / itemHeight;

        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final showPrice = product.isPaid && product.price != null;
            final formatter = ProductDataFormatter(product);

            return ProductCardContent(
              product: product,
              showPrice: showPrice,
              formatter: formatter,
            );
          },
        );
      },
    );
  }
}
