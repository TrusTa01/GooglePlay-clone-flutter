import 'package:flutter/material.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/shared/presentation/widgets/product_widgets/elements/product_section_header.dart';

class ProductPageDescriptionSection extends StatelessWidget {
  final ProductState state;
  final VoidCallback? onTap;

  const ProductPageDescriptionSection({
    super.key,
    required this.state,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductSectionHeader(
          title: state.descriptionSectionTitle,
          padding: EdgeInsets.zero,
          onTap: onTap,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Flexible(
              child: Text(
                state.shortDescription,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
