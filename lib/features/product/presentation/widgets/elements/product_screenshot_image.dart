import 'package:flutter/material.dart';
import 'package:google_play/core/presentation/widgets/components/images/network_image_builders.dart';

class ProductScreenshotImage extends StatelessWidget {
  final String imageUrl;
  final String productId;
  final int index;
  final double height;
  final double borderRadius;
  final void Function(String url, String tag)? onImageTap;

  const ProductScreenshotImage({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.index,
    this.height = 180,
    this.borderRadius = 6,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final String heroTag = '${productId}_screenshot_$index';

    final bool isHorizontal = imageUrl.contains('horiz');
    final double currentWidth = isHorizontal ? 300 : 120;

    final int cacheWidth = (currentWidth * 3).toInt();
    final int cacheHeight = (height * 3).toInt();

    return GestureDetector(
      onTap: () => onImageTap?.call(imageUrl, heroTag),
      child: Hero(
        tag: heroTag,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imageUrl,
              width: currentWidth,
              height: height,
              cacheWidth: cacheWidth,
              cacheHeight: cacheHeight,
              fit: BoxFit.cover,
              loadingBuilder: NetworkImageBuilders.shimmer(
                width: currentWidth,
                height: height,
                borderRadius: borderRadius,
              ),
              errorBuilder: NetworkImageBuilders.placeholder(
                width: currentWidth,
                height: height,
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
