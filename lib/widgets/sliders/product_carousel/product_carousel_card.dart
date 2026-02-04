import 'package:flutter/material.dart';

import '../../../screens/screens.dart';
import '../../../models/product_models/product_interface.dart';
import '../../widgets.dart';
import '../../../core/utils/formatters.dart';

class ProductCarouselCard extends StatelessWidget {
  final Product product;

  const ProductCarouselCard({super.key, required this.product});

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    final formatter = ProductDataFormatter(product);

    return Container(
      margin: const EdgeInsets.only(right: 11.9),
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
          ),
        ),
      ),
    );
  }
}
