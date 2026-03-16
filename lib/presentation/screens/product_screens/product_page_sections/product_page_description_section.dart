import 'package:flutter/material.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageDescriptionSection extends StatelessWidget {
  final ProductDetailsState state;

  const ProductPageDescriptionSection({
    super.key,
    required this.state,
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsScreen(state: state),
            ),
          ),
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
