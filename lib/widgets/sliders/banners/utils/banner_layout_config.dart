/// Адаптивные параметры баннера по ширине экрана.
class BannerLayoutConfig {
  final double viewportFraction;
  final double heightFactor;
  final double bannerPadding;
  final double horizontalPadding;

  const BannerLayoutConfig({
    required this.viewportFraction,
    required this.heightFactor,
    required this.bannerPadding,
    required this.horizontalPadding,
  });
}

// Breakpoints и конфигурации. До 500 — точные значения под адаптив виджета.
const List<(int, BannerLayoutConfig)> bannerLayoutBreakpoints = [
  (0, BannerLayoutConfig(
    viewportFraction: 0.88,
    heightFactor: 3.5,
    bannerPadding: 8,
    horizontalPadding: 18,
  )),
  (350, BannerLayoutConfig(
    viewportFraction: 0.905,
    heightFactor: 3.5,
    bannerPadding: 8,
    horizontalPadding: 18,
  )),
  (370, BannerLayoutConfig(
    viewportFraction: 0.915,
    heightFactor: 3.5,
    bannerPadding: 8,
    horizontalPadding: 18,
  )),
  (400, BannerLayoutConfig(
    viewportFraction: 0.925,
    heightFactor: 3.2,
    bannerPadding: 8,
    horizontalPadding: 22,
  )),
  (431, BannerLayoutConfig(
    viewportFraction: 0.925,
    heightFactor: 3.2,
    bannerPadding: 8,
    horizontalPadding: 22,
  )),
  (485, BannerLayoutConfig(
    viewportFraction: 0.915,
    heightFactor: 3.2,
    bannerPadding: 8,
    horizontalPadding: 22,
  )),
  (500, BannerLayoutConfig(
    viewportFraction: 0.7,
    heightFactor: 3.1,
    bannerPadding: 8,
    horizontalPadding: 22,
  )),
  (600, BannerLayoutConfig(
    viewportFraction: 0.6,
    heightFactor: 2.8,
    bannerPadding: 16,
    horizontalPadding: 28,
  )),
  (700, BannerLayoutConfig(
    viewportFraction: 0.5,
    heightFactor: 3,
    bannerPadding: 16,
    horizontalPadding: 28,
  )),
  (800, BannerLayoutConfig(
    viewportFraction: 0.45,
    heightFactor: 3.5,
    bannerPadding: 20,
    horizontalPadding: 36,
  )),
  (1000, BannerLayoutConfig(
    viewportFraction: 0.4,
    heightFactor: 3.5,
    bannerPadding: 24,
    horizontalPadding: 44,
  )),
];

BannerLayoutConfig getBannerLayoutConfigForWidth(double width) {
  BannerLayoutConfig config = bannerLayoutBreakpoints.first.$2;
  for (final (breakpoint, cfg) in bannerLayoutBreakpoints) {
    if (width >= breakpoint) {
      config = cfg;
    } else {
      break;
    }
  }
  return config;
}
