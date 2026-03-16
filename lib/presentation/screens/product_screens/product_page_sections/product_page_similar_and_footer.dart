import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

// TODO: заменить тип у similar products
class ProductPageSimilarAndFooter extends StatelessWidget {
  final ProductEntity product;
  final List<ProductEntity> similarProducts;
  final String link;

  const ProductPageSimilarAndFooter({
    super.key,
    required this.product,
    required this.similarProducts,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (similarProducts.isNotEmpty) ...[
          ProductCarousel(
            title: product.title,
            items: similarProducts,
            maxItems: 10,
            leftPadding: 0,
            needsRightPadding: false,
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
