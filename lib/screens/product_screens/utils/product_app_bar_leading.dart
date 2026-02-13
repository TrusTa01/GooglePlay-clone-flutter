import 'package:flutter/material.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/product_screens/utils/product_ui_config.dart';
import 'package:google_play/widgets/widgets.dart';

// Миниатюра продукта для использования в SimpleAppBar (titleLeading).
class ProductAppBarLeading extends StatelessWidget {
  final Product product;

  const ProductAppBarLeading({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final utils = ProductUIConfig(product);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ProductCardThumbnail(
        borderRadius: utils.smallBorderRadius,
        iconUrl: product.iconUrl,
        iconWidth: utils.smallIconWidth,
        iconHeight: utils.smallIconHeight,
        cacheWidth: utils.smallCacheWidth,
        cacheHeight: utils.smallCacheHeight,
        fit: utils.isBook ? BoxFit.fill : BoxFit.cover,
      ),
    );
  }
}
