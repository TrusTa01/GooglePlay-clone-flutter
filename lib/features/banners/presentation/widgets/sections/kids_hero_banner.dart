import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/features/banners/presentation/widgets/configs/kids_hero_banner_layout_config.dart';

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
        final KidsHeroBannerLayoutConfig config =
            getKidsHeroBannerLayoutConfigForWidth(maxWidth);
        final double bannerHeight = maxWidth * config.heightFactor;

        return GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Image.asset(
                imageAssetPath,
                height: bannerHeight,
                width: double.infinity,
                fit: config.imageFit,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: config.horizontalPadding,
                  vertical: config.verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: titleTextColor ?? Colors.black,
                        fontSize: config.titleFontSize,
                        fontWeight: Constants.defaultFontWeight,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: subtitleTextColor ?? Colors.grey.shade900,
                        fontSize: config.titleFontSize * config.subtitleScale,
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
