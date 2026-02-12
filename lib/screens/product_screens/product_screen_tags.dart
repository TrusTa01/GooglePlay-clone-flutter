import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../models/models.dart';
import '../../providers/products_provider.dart';
import '../../services/product_query_service.dart';
import '../screens.dart';

class ProductTag extends StatelessWidget {
  final Product product;
  final String tag;
  final VoidCallback onTap;

  const ProductTag({
    required this.product,
    super.key,
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Constants.defaultTextColor.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tag,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: Constants.defaultFontWeight,
          ),
        ),
      ),
    );
  }
}

class ProductTags extends StatelessWidget {
  final Product product;
  const ProductTags({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: product.tags
          .map(
            (tag) => ProductTag(
              product: product,
              tag: tag,
              onTap: () {
                final allProducts = context
                    .read<ProductsProvider>()
                    .allProducts;
                final queryService = ProductQueryService();
                final filteredProducts = queryService.getProductsByTag(
                  allProducts,
                  tag,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryFullListScreen(
                      title: tag,
                      products: filteredProducts,
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
