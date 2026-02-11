import 'package:flutter/material.dart';

import '../../../screens/screens.dart';
import '../../../models/product_models/product_interface.dart';
import '../../widgets.dart';
import '../../../core/utils/formatters.dart';

class ProductCarouselCard extends StatelessWidget {
  final Product product;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;
  final int cacheHeight;

  const ProductCarouselCard({
    super.key,
    required this.product,
    this.iconWidth = 110,
    this.iconHeight = 110,
    this.cacheWidth = 300,
    this.cacheHeight = 350,
  });

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    final formatter = ProductDataFormatter(product);

    return Container(
      margin: const EdgeInsets.only(right: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPageScreen(product: product),
              ),
            );
          },
          onLongPress: () {},
          child: ProductCardContent(
            product: product,
            showPrice: showPrice,
            formatter: formatter,
            iconWidth: iconWidth,
            iconHeight: iconHeight,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
          ),
        ),
      ),
    );
  }
}
