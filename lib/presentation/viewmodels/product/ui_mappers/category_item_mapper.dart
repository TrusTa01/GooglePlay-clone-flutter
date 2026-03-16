import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/category_item_ui_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_card_ui_model.dart';

/// Маппер из [ProductDetailsState] в UI‑модели,
/// используемые в блоке CategoryDetailsSection
class CategoryItemMapper {
  const CategoryItemMapper();

  /// Строит один [CategoryItemUiModel] из состояния экрана продукта
  CategoryItemUiModel fromState(ProductDetailsState state) {
    return CategoryItemUiModel(
      id: state.productId ?? '',
      isBook: state.isBook,
      card: _mapToProductCardUi(state),
    );
  }

  /// Удобный хелпер для списков
  List<CategoryItemUiModel> fromStates(List<ProductDetailsState> states) {
    return states.map(fromState).toList();
  }

  /// Маппинг параметров карточки
  ProductCardUiModel _mapToProductCardUi(ProductDetailsState state) {
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
