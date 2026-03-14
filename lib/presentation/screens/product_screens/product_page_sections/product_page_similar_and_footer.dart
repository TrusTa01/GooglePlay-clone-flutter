import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageSimilarAndFooter extends StatelessWidget {
  final Product product;
  final List<Product> similarProducts;

  const ProductPageSimilarAndFooter({
    super.key,
    required this.product,
    required this.similarProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (similarProducts.isNotEmpty) ...[
          ProductCarousel(
            title: product is Book
                ? context.l10n.similarBooks
                : product is Game
                    ? context.l10n.similarGames
                    : context.l10n.similarApps,
            products: similarProducts,
            maxItems: 10,
            leftPadding: 0,
            needsRightPadding: false,
          ),
        ],
        const SizedBox(height: 25),
        CustomTextButton(
          title: context.l10n.refundPolicy,
          icon: Icons.arrow_back,
          onTap: () => launchMyUrl('https://support.google.com/googleplay/'),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(context.l10n.pricesIncludeVat),
          ],
        ),
      ],
    );
  }
}
