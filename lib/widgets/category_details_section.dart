import 'package:flutter/material.dart';

import 'widgets.dart';
import '../../models/models.dart';
import '../core/utils/formatters.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<Product> products;

  const CategoryDetailsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final bool isBook = products.first is Book;
    final double minItemWidth = isBook ? 100 : 125;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Сначала вычисляем количество колонок
        final int crossAxisCount = ((constraints.maxWidth - 30) / minItemWidth)
            .floor()
            .clamp(2, 8);

        // Фиксированные отступы
        final double horizontalPadding = 16;

        // Вычисляем aspectRatio
        final double aspectRatio = isBook ? 0.5 : 0.6;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Constants.sliderMaxContentWidth,
            ),
            child: GridView.builder(
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
            ),
          ),
        );
      },
    );
  }
}
