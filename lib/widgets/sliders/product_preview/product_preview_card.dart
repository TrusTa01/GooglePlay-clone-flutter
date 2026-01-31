import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

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
            clipBehavior: Clip
                .none, // Элементы будут визуально выезжать за пределы контейнера
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
          ActionRow(product: product, showButton: true),
        ],
      ],
    );
  }
}
