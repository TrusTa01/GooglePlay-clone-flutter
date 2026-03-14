import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductGridCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onProductTap;

  const ProductGridCard({
    super.key,
    required this.product,
    required this.onProductTap,
  });

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onProductTap,
      child: ActionRow(
        product: product,
        showButton: false,
        iconWidth: 65,
        iconHeight: 65,
        cacheWidth: 190,
        cacheHeight: 190,
        hasThreeLines: true,
      ),
    );
  }
}
