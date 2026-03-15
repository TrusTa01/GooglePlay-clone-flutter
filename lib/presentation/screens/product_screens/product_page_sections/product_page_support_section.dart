import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/screens/product_screens/utils/product_support_data.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

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
            title: context.l10n.aboutAuthor,
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
            items: getSupportItems(context, product),
            title: Text(
              context.l10n.appSupport,
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
