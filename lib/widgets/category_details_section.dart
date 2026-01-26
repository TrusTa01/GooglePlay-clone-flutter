import 'package:flutter/material.dart';

import 'widgets.dart';
import '../../models/models.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<Product> products;

  const CategoryDetailsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final bool isBook = products.first is Book;
    final double aspectRatio = isBook ? 0.52 : 0.65;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 10,
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
  }
}
