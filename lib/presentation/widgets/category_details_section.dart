import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class CategoryDetailsSection extends StatelessWidget {
  final List<ProductEntity> products;
  final bool isSliver;

  const CategoryDetailsSection({
    super.key,
    required this.products,
    this.isSliver = false,
  });

  static Widget asSliver({required List<ProductEntity> products}) {
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

    final bool isBook = products.first is BookEntity;
    final double minItemWidth = isBook ? 110 : 125;
    // Вычисляем aspectRatio
    final double aspectRatio = isBook ? 0.48 : 0.6;

    if (isSliver) {
      return SliverLayoutBuilder(
        builder: (BuildContext context, SliverConstraints constraints) {
          final double width = constraints.crossAxisExtent;
          final int crossAxisCount = ((width - 32) / minItemWidth)
              .floor()
              .clamp(2, 8);

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => KeyedSubtree(
                  key: ValueKey(products[index].id),
                  child: _buildItem(products[index]),
                ),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => KeyedSubtree(
            key: ValueKey(products[index].id),
            child: _buildItem(products[index]),
          ),
        );
      },
    );
  }

  Widget _buildItem(ProductEntity product) {
    final showPrice = product.isPaid && product.price != null;
    final formatter = ProductDataFormatter(product);
    final isBook = product is BookEntity;

    return ProductCardContent(
      product: product,
      showPrice: showPrice,
      formatter: formatter,
      iconWidth: isBook ? 110 : 125,
      iconHeight: isBook ? 160 : 125,
      cacheWidth: isBook ? 300 : 350,
      cacheHeight: isBook ? 450 : 350,
    );
  }
}
