import 'package:flutter/material.dart';
import 'package:google_play/presentation/viewmodels/product/product_details_state.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

// Миниатюра продукта для использования в SimpleAppBar (titleLeading)
class ProductAppBarLeading extends StatelessWidget {
  final ProductDetailsState state;

  const ProductAppBarLeading({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ProductCardThumbnail(
        borderRadius: state.smallBorderRadius,
        iconUrl: state.iconUrl,
        iconWidth: state.smallIconWidth,
        iconHeight: state.smallIconHeight,
        cacheWidth: state.smallCacheWidth,
        cacheHeight: state.smallCacheHeight,
        fit: state.thumbnailFit,
      ),
    );
  }
}
