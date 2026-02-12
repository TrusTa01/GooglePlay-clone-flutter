import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/product_screens/product_page_sections/product_page_rating_row.dart';
import 'package:google_play/screens/product_screens/utils/product_ui_config.dart';
import 'package:google_play/widgets/widgets.dart';

class ProductPageHeader extends StatelessWidget {
  final Product product;
  final ProductDataFormatter formatter;
  final ProductUIConfig utils;

  const ProductPageHeader({
    super.key,
    required this.product,
    required this.formatter,
    required this.utils,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProductCardThumbnail(
              borderRadius: utils.borderRadius,
              iconUrl: product.iconUrl,
              iconWidth: utils.iconWidth,
              iconHeight: utils.iconHeight,
              cacheWidth: utils.cacheWidth,
              cacheHeight: utils.cacheHeight,
              fit: utils.isBook ? BoxFit.fill : BoxFit.cover,
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.creator,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Constants.googleBlue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (product is Book) ...[
                    const SizedBox(height: 10),
                    Text(
                      (product as Book).publisher,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ] else if (product.isPaid)
                    Text(
                      'Есть платный контент',
                      style: const TextStyle(fontSize: 10),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        ProductPageRatingRow(product: product, formatter: formatter),
        const SizedBox(height: 25),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (product is Book && (product as Book).hasAudioVersion) ...[
              Expanded(
                child: CustomElevatedButton(
                  defaultButtonText: 'Фрагмент',
                  isPaid: false,
                  isOutlined: true,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: CustomElevatedButton(
                isPaid: product.isPaid,
                price: formatter.price,
                defaultButtonText: 'Установить',
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        if (product is App || product is Game)
          ProductPreviewCard(
            product: product,
            showActionRow: false,
          ),
      ],
    );
  }
}
