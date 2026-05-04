import 'package:flutter/material.dart';
import 'package:google_play/core/presentation/widgets/components/feedback/error/asset_not_found_placeholder.dart';
import 'package:google_play/core/presentation/widgets/shimmers/shimmer_box.dart';

class NetworkImageBuilders {
  const NetworkImageBuilders._();

  static ImageLoadingBuilder shimmer({
    required double width,
    required double height,
    double borderRadius = 0,
  }) => (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return ShimmerBox(width: width, height: height, borderRadius: borderRadius);
  };

  static ImageErrorWidgetBuilder icon({
    required double size,
    Color? color,
    IconData icon = Icons.broken_image_outlined,
  }) =>
      (context, error, stackTrace) => Icon(icon, size: size, color: color);

  static ImageErrorWidgetBuilder placeholder({
    required double width,
    required double height,
    double borderRadius = 0,
  }) =>
      (context, error, stackTrace) => AssetNotFoundPlaceholder(
        width: width,
        height: height,
        borderRadius: borderRadius,
      );
}
