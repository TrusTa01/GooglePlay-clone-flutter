import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_card_ui_model.dart';

class ProductCardMapper {
  const ProductCardMapper();

  /// Маппинг параметров карточки
  ProductCardUiModel mapToProductCardUi(ProductState state) {
    final bool showPrice = state.isPaid && state.price.isNotEmpty;
    final String mainTagText = showPrice ? state.price : state.ratingAvgText;
    final String? mainTagIconPath = showPrice ? null : 'assets/icons/star.png';

    final model = ProductCardUiModel(
      id: state.id,
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
    FeatureTalker.mapperOut(
      'product.product_card_mapper',
      'ProductCardUiModel',
      context: {'id': state.id, 'isPaid': state.isPaid, 'showPrice': showPrice},
    );
    return model;
  }
}
