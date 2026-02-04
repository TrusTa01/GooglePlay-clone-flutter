import 'package:flutter/material.dart';

import '../../../screens/screens.dart';
import '../../../models/models.dart';
import '../../widgets.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({super.key, required this.product});

  final Product product;

  bool get showPrice => product.isPaid && product.price != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPageScreen(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: ActionRow(
          product: product,
          showButton: false,
          iconWidth: 65,
          iconHeight: 65,
          cacheWidth: 190,
          cacheHeight: 190,
          hasThreeLines: true,
        ),
      ),
    );
  }
}
