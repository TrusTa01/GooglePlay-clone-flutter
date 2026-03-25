import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_card_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';

/// Маппер из [ProductState] в UI‑модели,
/// используемые в блоке CategoryDetailsSection
class CategoryItemMapper {
  const CategoryItemMapper();

  /// Строит один [CategoryItemUiModel] из состояния экрана продукта
  CategoryItemUiModel fromState(ProductState state) {
    final productCard = ProductCardMapper();

    return CategoryItemUiModel(
      id: state.productId,
      isBook: state.isBook,
      card: productCard.mapToProductCardUi(state),
    );
  }
}
