import 'package:flutter/material.dart';

class ProductPageScreen extends StatelessWidget {
  const ProductPageScreen({super.key, this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(productId != null ? 'ProductPageScreen: $productId' : 'ProductPageScreen'),
    );
  }
}
