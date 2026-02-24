import 'package:flutter/material.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

class ProductPreviewCard extends StatelessWidget {
  final Product product;
  final bool showActionRow;

  const ProductPreviewCard({
    super.key,
    required this.product,
    this.showActionRow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: product.screenshots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductScreenshotImage(
                  imageUrl: product.screenshots[index],
                  productId: product.id,
                  index: index,
                ),
              );
            },
          ),
        ),
        if (showActionRow) ...[
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductPageScreen(product: product),
                  ),
                );
              },
              child: ActionRow(
                product: product,
                showButton: false,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
