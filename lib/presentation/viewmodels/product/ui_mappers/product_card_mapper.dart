import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_card_ui_model.dart';

class ProductCardMapper {
  const ProductCardMapper();
  
  /// Маппинг параметров карточки
  ProductCardUiModel mapToProductCardUi(ProductState state) {
    final bool showPrice = state.isPaid && state.price.isNotEmpty;

    final String mainTagText = showPrice
        ? state.price
        : state.rating > 0
        ? state.rating.toStringAsFixed(1)
        : '';

    final String? mainTagIconPath = showPrice ? null : 'assets/icons/star.png';

    return ProductCardUiModel(
      id: state.productId ?? '',
      title: state.title,
      iconUrl: state.iconUrl,
      mainTagText: mainTagText,
      mainTagIconPath: mainTagIconPath,
      borderRadius: state.borderRadius,
      iconWidth: state.iconWidth,
      iconHeight: state.iconHeight,
      cacheWidth: state.cacheWidth,
      cacheHeight: state.cacheHeight,
      thumbnailFit: state.thumbnailFit,
    );
  }
}
