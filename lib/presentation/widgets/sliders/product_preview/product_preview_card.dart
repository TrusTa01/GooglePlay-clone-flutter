import 'package:flutter/material.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPreviewCard extends StatelessWidget {
  final String productId;
  final List<String> screenshots;
  final ActionRowUiModel? actionRow;
  final VoidCallback? onTap;
  final void Function(String url, String tag)? onImageTap;

  const ProductPreviewCard({
    super.key,
    required this.productId,
    required this.screenshots,
    this.actionRow,
    this.onTap,
    this.onImageTap,
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
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductScreenshotImage(
                  imageUrl: screenshots[index],
                  productId: productId,
                  index: index,
                  onImageTap: onImageTap,
                ),
              );
            },
          ),
        ),
        if (actionRow != null) ...[
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: ActionRow(model: actionRow!, showButton: false),
            ),
          ),
        ],
      ],
    );
  }
}
