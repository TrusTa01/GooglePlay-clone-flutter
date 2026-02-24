import 'package:flutter/material.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:google_play/core/utils/url_launcher.dart';

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
                ? 'Похожие книги'
                : product is Game
                ? 'Похожие игры'
                : 'Похожие приложения',
            products: similarProducts,
            maxItems: 10,
            leftPadding: 0,
            needsRightPadding: false,
          ),
        ],
        const SizedBox(height: 25),

        CustomTextButton(
          title: 'Правила возврата платежей в Google Play',
          icon: Icons.arrow_back,
          onTap: () => launchMyUrl('https://support.google.com/googleplay/'),
        ),

        const SizedBox(height: 20),
        Row(children: [const Text('Все цены указаны с учетом НДС.')]),
      ],
    );
  }
}
