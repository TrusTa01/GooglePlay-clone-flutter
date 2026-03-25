import 'package:flutter/material.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_card_ui_model.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class ProductCarouselCard extends StatelessWidget {
  final ProductCardUiModel model;
  final VoidCallback onTap;

  const ProductCarouselCard({
    super.key,
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          onLongPress: () {},
          child: ProductCardContent(model: model),
        ),
      ),
    );
  }
}
