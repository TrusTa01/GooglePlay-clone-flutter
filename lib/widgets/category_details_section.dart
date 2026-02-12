import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/widgets/widgets.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<Product> products;
  final bool isSliver;

  const CategoryDetailsSection({
    super.key,
    required this.products,
    this.isSliver = false,
  });

  static Widget asSliver({required List<Product> products}) {
    return CategoryDetailsSection(products: products, isSliver: true);
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      debugPrint('Ошибка: products.isEmpty (category details section)');
      return isSliver
          ? const SliverToBoxAdapter(child: SizedBox.shrink())
          : const SizedBox.shrink();
    }

    final bool isBook = products.first is Book;
    final double minItemWidth = isBook ? 100 : 125;
    // Вычисляем aspectRatio
    final double aspectRatio = isBook ? 0.5 : 0.6;

    if (isSliver) {
      return SliverLayoutBuilder(
        builder: (BuildContext context, SliverConstraints constraints) {
          final double width = constraints.crossAxisExtent;
          final int crossAxisCount = ((width - 32) / minItemWidth)
              .floor()
              .clamp(2, 8);

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildItem(products[index]),
                childCount: products.length,
              ),
            ),
          );
        },
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final int crossAxisCount = ((width - 32) / minItemWidth).floor().clamp(
          2,
          8,
        );

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => _buildItem(products[index]),
        );
      },
    );
  }

  Widget _buildItem(Product product) {
    final showPrice = product.isPaid && product.price != null;
    final formatter = ProductDataFormatter(product);

    return ProductCardContent(
      product: product,
      showPrice: showPrice,
      formatter: formatter,
    );
  }
}
