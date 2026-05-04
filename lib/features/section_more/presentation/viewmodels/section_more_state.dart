import 'package:google_play/features/product/presentation/viewmodels/ui_models/category_item_ui_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_preview_section_ui_model.dart';

final class SectionMoreState {
  final String title;
  final String categoryKey;
  final bool isEmpty;
  final bool isGame;
  final ProductPreviewSectionUiModel? previewModel;
  final List<CategoryItemUiModel> items;

  const SectionMoreState({
    required this.title,
    required this.categoryKey,
    required this.isEmpty,
    required this.isGame,
    this.previewModel,
    this.items = const <CategoryItemUiModel>[],
  });
}
