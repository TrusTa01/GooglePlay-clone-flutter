import 'package:google_play/presentation/viewmodels/product/ui_models/category_item_ui_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_preview_section_ui_model.dart';

class CategoryOverviewState {
  final String title;
  final String categoryKey;

  final bool isEmpty;
  final bool isGame;

  /// Заполнен, когда `isGame == true` и `isEmpty == false`.
  final ProductPreviewSectionUiModel? previewModel;

  /// Заполнен, когда `isGame == false` и `isEmpty == false`.
  final List<CategoryItemUiModel> items;

  const CategoryOverviewState({
    required this.title,
    required this.categoryKey,
    required this.isEmpty,
    required this.isGame,
    this.previewModel,
    this.items = const <CategoryItemUiModel>[],
  });
}
