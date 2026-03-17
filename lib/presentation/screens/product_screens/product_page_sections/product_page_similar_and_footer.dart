import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_card_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageSimilarAndFooter extends StatelessWidget {
  final String sectionTitle;
  final List<ProductCardUiModel> similarProducts;
  final String link;
  final ValueChanged onProductTap;

  const ProductPageSimilarAndFooter({
    super.key,
    required this.sectionTitle,
    required this.similarProducts,
    required this.link,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (similarProducts.isNotEmpty) ...[
          ProductCarousel(
            title: sectionTitle,
            items: similarProducts,
            maxItems: 10,
            leftPadding: 0,
            needsRightPadding: false,
            onProductTap: onProductTap,
          ),
        ],
        const SizedBox(height: 25),
        CustomTextButton(
          title: context.l10n.refundPolicy,
          icon: Icons.arrow_back,
          onTap: () => launchMyUrl(link),
        ),
        const SizedBox(height: 20),
        Row(children: [Text(context.l10n.pricesIncludeVat)]),
      ],
    );
  }
}
