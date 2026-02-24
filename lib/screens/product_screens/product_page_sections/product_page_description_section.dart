import 'package:flutter/material.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/screens/product_screens/utils/product_ui_config.dart';
import 'package:google_play/widgets/widgets.dart';

class ProductPageDescriptionSection extends StatelessWidget {
  final Product product;
  final ProductUIConfig utils;

  const ProductPageDescriptionSection({
    super.key,
    required this.product,
    required this.utils,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionHeader(
          title: utils.titleText,
          padding: EdgeInsets.zero,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: Text(
                product.shortDescription,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
