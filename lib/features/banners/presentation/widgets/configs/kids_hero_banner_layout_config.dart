import 'package:flutter/material.dart';

class KidsHeroBannerLayoutConfig {
  final double heightFactor;
  final BoxFit imageFit;
  final double titleFontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double subtitleScale;

  const KidsHeroBannerLayoutConfig({
    required this.heightFactor,
    required this.imageFit,
    required this.titleFontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.subtitleScale = 0.78,
  });
}

const List<(int, KidsHeroBannerLayoutConfig)> kidsHeroBannerLayoutBreakpoints = [
  (
    0,
    KidsHeroBannerLayoutConfig(
      heightFactor: 0.35,
      imageFit: BoxFit.cover,
      titleFontSize: 16,
      horizontalPadding: 16,
      verticalPadding: 12,
    ),
  ),
  (
    350,
    KidsHeroBannerLayoutConfig(
      heightFactor: 0.25,
      imageFit: BoxFit.cover,
      titleFontSize: 18,
      horizontalPadding: 20,
      verticalPadding: 15,
    ),
  ),
  (
    600,
    KidsHeroBannerLayoutConfig(
      heightFactor: 0.2,
      imageFit: BoxFit.contain,
      titleFontSize: 22,
      horizontalPadding: 24,
      verticalPadding: 18,
    ),
  ),
];

KidsHeroBannerLayoutConfig getKidsHeroBannerLayoutConfigForWidth(double width) {
  KidsHeroBannerLayoutConfig config = kidsHeroBannerLayoutBreakpoints.first.$2;
  for (final (breakpoint, cfg) in kidsHeroBannerLayoutBreakpoints) {
    if (width >= breakpoint) {
      config = cfg;
    } else {
      break;
    }
  }
  return config;
}
