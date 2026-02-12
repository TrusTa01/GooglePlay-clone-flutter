import 'package:google_play/core/constants.dart';

const double carouselBookCardWidth = 115;
const double carouselProductCardMinWidth = 115;
const double carouselCardSpacing = 10.9;

/// Количество видимых карточек по брейкпоинтам (3–8).
int carouselVisibleCountForWidth(double width) {
  if (width >= Constants.sliderMaxContentWidth) return 8;
  if (width >= 900) return 7;
  if (width >= 768) return 6;
  if (width >= 600) return 5;
  if (width >= 480) return 4;
  return 3;
}
