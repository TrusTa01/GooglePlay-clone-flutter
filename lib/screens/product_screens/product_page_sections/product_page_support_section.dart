import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/screens/product_screens/utils/product_support_data.dart';
import 'package:google_play/widgets/widgets.dart';

class ProductPageSupportSection extends StatelessWidget {
  final Product product;

  const ProductPageSupportSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product is Book) ...[
          ProductSectionHeader(
            title: 'Об авторе',
            padding: EdgeInsets.zero,
            subtitle: product.creator,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AboutAuthorScreen(product: product),
              ),
            ),
          ),
        ],
        if (product is App || product is Game) ...[
          CustomExpansionTile(
            items: getSupportItems(product),
            title: Text(
              'Поддержка приложения',
              style: TextStyle(
                fontWeight: Constants.defaultFontWeight,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
