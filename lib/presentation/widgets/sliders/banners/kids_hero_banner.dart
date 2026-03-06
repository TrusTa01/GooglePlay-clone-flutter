import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class KidsHeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleTextColor;
  final Color? subtitleTextColor;
  final String imageAssetPath;
  final VoidCallback? onTap;

  const KidsHeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleTextColor,
    this.subtitleTextColor,
    required this.imageAssetPath,
    this.onTap,
  });

  @override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final double maxWidth = constraints.maxWidth;

      // Адаптивные значения на основе ширины
      late final double bannerHeight;
      late final BoxFit fit;
      late final double titleFontSize;
      late final double horizontalPadding;
      late final double verticalPadding;

      if (maxWidth < 350) {
        // Маленький экран (телефон в портрете)
        bannerHeight = maxWidth * 0.35;
        fit = BoxFit.cover;
        titleFontSize = 16;
        horizontalPadding = 16;
        verticalPadding = 12;
      } else if (maxWidth < 600) {
        // Средний экран (телефон в ландшафте / маленький планшет)
        bannerHeight = maxWidth * 0.25;
        fit = BoxFit.cover;
        titleFontSize = 18;
        horizontalPadding = 20;
        verticalPadding = 15;
      } else {
        // Большой экран (планшет / десктоп)
        bannerHeight = maxWidth * 0.2;
        fit = BoxFit.contain;
        titleFontSize = 22;
        horizontalPadding = 24;
        verticalPadding = 18;
      }

      return GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(
              imageAssetPath,
              height: bannerHeight,
              width: double.infinity,
              fit: fit,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: titleTextColor ?? Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleTextColor ?? Colors.grey.shade900,
                      fontSize: titleFontSize * 0.78,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
}
