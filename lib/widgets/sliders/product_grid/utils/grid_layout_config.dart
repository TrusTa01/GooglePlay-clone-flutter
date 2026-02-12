/// Адаптивная конфигурация сетки продуктов.
class ProductGridLayoutConfig {
  final double viewportFraction;
  final double heightFactor;
  final double cardPadding;

  const ProductGridLayoutConfig({
    required this.viewportFraction,
    required this.heightFactor,
    required this.cardPadding,
  });
}

ProductGridLayoutConfig productGridAdaptiveConfig(double width) {
  double idealCardWidth = width < 600 ? 300 : 320;
  double count = width / idealCardWidth;

  if (width < 600) {
    count = count.clamp(1.1, 1.2);
  } else if (width < 950) {
    count = count.clamp(2, 2.8);
  } else {
    count = 3.0;
  }

  double finalFraction = 1 / count;

  return ProductGridLayoutConfig(
    viewportFraction: finalFraction,
    heightFactor: width < 600 ? 240 : (width < 1000 ? 250 : 260),
    cardPadding: width < 600 ? 6 : (width < 1000 ? 10 : 12),
  );
}
