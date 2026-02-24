import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/utils/formatters.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/widgets/buttons/elevated_button.dart';
import 'package:google_play/widgets/sliders/utils/product_card_components.dart';

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
    if (product == null) return const SizedBox.shrink();

    final formatter = ProductDataFormatter(product);

    bool containsPaidContent = false;
    if (product is Game || product is App) {
      containsPaidContent = product.containsPaidContent;
    }

    final String iconPath = 'assets/icons/star.png';
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProductCardThumbnail(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          iconUrl: product.iconUrl,
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
                title: product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  if (!hasThreeLines) ...[
                    ProductCreatorText(creator: product.creator),
                    const DotSeparator(),
                    AgeBadge(age: product.ageRating),
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
                        Expanded(child: ActionRowTags(product: product)),
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
                        if (product is Book)
                          ProductInfoTag(
                            text: product.format,
                            hasBackground: true,
                          ),
                        if (product is! Book)
                          ProductInfoTag(
                            text: formatter.technicalInfoFormatted,
                            hasBackground: false,
                          ),
                        const SizedBox(width: 10),
                        if (product is Game || product is App)
                          if (product.eventText != null &&
                              !product.isPaid)
                            Flexible(
                              child: ProductInfoTag(
                                text: product.eventText!,
                              ),
                            ),
                        if (product.isPaid && screenWidth > 320)
                          ProductInfoTag(text: formatter.price),
                        if (product is Book && !product.isPaid)
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
                isPaid: product.isPaid,
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
