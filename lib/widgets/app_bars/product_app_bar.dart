import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../screens/product_screens/utils/product_ui_config.dart';
import '../widgets.dart';

class ProductAppBar extends AppBars {
  ProductAppBar({
    super.key,
    required Product product,
    String? subtitle,
    super.actions,
    super.onLeadingPressed,
    super.type = AppBarType.basic,
  }) : super(
          showBackButton: true,
          showLogo: false,
          forceShowDivider: type != AppBarType.transparent,
          titleLeading: type == AppBarType.transparent
              ? null
              : _ProductTitleLeading(product: product),
          title: type == AppBarType.transparent
              ? const Text('')
              : Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: Constants.defaultFontWeight,
                  ),
                ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              : null,
        );
}

class _ProductTitleLeading extends StatelessWidget {
  final Product product;

  const _ProductTitleLeading({required this.product});

  @override
  Widget build(BuildContext context) {
    final utils = ProductUIConfig(product);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ProductCardThumbnail(
        borderRadius: utils.smallBorderRadius,
        iconUrl: product.iconUrl,
        iconWidth: utils.smallIconWidth,
        iconHeight: utils.smallIconHeight,
        cacheWidth: utils.smallCacheWidth,
        cacheHeight: utils.smallCacheHeight,
        fit: utils.isBook ? BoxFit.fill : BoxFit.cover,
      ),
    );
  }
}
