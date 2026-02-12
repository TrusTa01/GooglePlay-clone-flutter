import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/global_constants.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/models.dart';
import '../../../providers/products_provider.dart';
import '../../buttons/elevated_button.dart';
import 'product_card_components.dart';

class ActionRow extends StatelessWidget {
  final dynamic product;
  final ActionBanner? banner;
  final bool hasThreeLines;
  final bool showButton;
  final String? eventText;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;
  final int cacheHeight;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  const ActionRow({
    super.key,
    this.product,
    this.banner,
    this.iconWidth = 45,
    this.iconHeight = 45,
    this.cacheWidth = 150,
    this.cacheHeight = 150,
    this.eventText,
    this.showButton = true,
    this.hasThreeLines = false,
    this.borderRadius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final currentProduct =
        product ??
        (banner != null
            ? context.read<ProductsProvider>().getProductById(banner!.productId)
            : null);

    if (currentProduct == null) return const SizedBox.shrink();

    final formatter = ProductDataFormatter(currentProduct);

    bool containsPaidContent = false;
    if (currentProduct is Game || currentProduct is App) {
      containsPaidContent = currentProduct.containsPaidContent;
    }

    final String iconPath = 'assets/icons/star.png';
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductCardThumbnail(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          iconUrl: currentProduct.iconUrl,
          iconWidth: iconWidth,
          iconHeight: iconHeight,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          fit: fit ?? BoxFit.cover,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductTitle(
                title: currentProduct.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  if (!hasThreeLines) ...[
                    ProductCreatorText(creator: currentProduct.creator),
                    const DotSeparator(),
                    AgeBadge(age: currentProduct.ageRating),
                    const SizedBox(width: 10),
                    if (screenWidth > 320)
                      ProductInfoTag(
                        text: formatter.rating,
                        iconPath: iconPath,
                      ),
                  ],
                ],
              ),
              if (hasThreeLines)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: ActionRowTags(product: currentProduct)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        ProductInfoTag(
                          text: formatter.rating,
                          iconPath: iconPath,
                          iconColor: Constants.googleBlue,
                        ),
                        const SizedBox(width: 10),
                        if (currentProduct is Book)
                          ProductInfoTag(
                            text: currentProduct.format,
                            hasBackground: true,
                          ),
                        if (currentProduct is! Book)
                          ProductInfoTag(
                            text: formatter.technicalInfoFormatted,
                            hasBackground: false,
                          ),
                        const SizedBox(width: 10),
                        if (currentProduct is Game || currentProduct is App)
                          if (currentProduct.eventText != null &&
                              !currentProduct.isPaid)
                            Flexible(
                              child: ProductInfoTag(
                                text: currentProduct.eventText!,
                              ),
                            ),
                        if (currentProduct.isPaid && screenWidth > 320)
                          ProductInfoTag(text: formatter.price),
                        if (currentProduct is Book && !currentProduct.isPaid)
                          ProductInfoTag(text: 'Бесплатно'),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (showButton)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                isPaid: currentProduct.isPaid,
                price: formatter.price,
                defaultButtonText: 'Установить',
              ),
              if (containsPaidContent)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Есть платный контент',
                    style: TextStyle(fontSize: 8, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class ActionRowButton extends StatelessWidget {
  final bool isPaid;
  final String price;
  final String defaultButtonText;
  final bool containsPaidContent;

  const ActionRowButton({
    super.key,
    required this.isPaid,
    required this.price,
    required this.defaultButtonText,
    required this.containsPaidContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomElevatedButton(
          isPaid: isPaid,
          price: price,
          defaultButtonText: 'Установить',
        ),
        if (containsPaidContent)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Есть платный контент',
              style: TextStyle(fontSize: 8, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
