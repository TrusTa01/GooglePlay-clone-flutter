import 'package:flutter/material.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

class TopChartsCard extends StatelessWidget {
  const TopChartsCard({super.key, required this.product, required this.rank});

  final Product product;
  final int rank;

  @override
  Widget build(BuildContext context) {
    final isBook = product is Book;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '$rank',
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductPageScreen(productId: product.id),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: ActionRow(
                product: product,
                hasThreeLines: true,
                showButton: false,
                iconWidth: isBook ? 60 : 65,
                iconHeight: isBook ? 90 : 65,
                cacheWidth: isBook ? 180 : 190,
                cacheHeight: isBook ? 270 : 190,
                borderRadius: isBook
                    ? BorderRadius.circular(6)
                    : BorderRadius.circular(12),
                fit: isBook ? BoxFit.fill : BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
