import 'package:google_play/presentation/viewmodels/product/ui_models/category_item_ui_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/product_preview_section_ui_model.dart';

class SectionMoreState {
  final String title;
  final bool isLoading;
  final Object? error;
  final bool isEmpty;
  final bool isGame;
  final ProductPreviewSectionUiModel? previewModel;
  final List<CategoryItemUiModel> items;

  const SectionMoreState({
    this.title = '',
    this.isLoading = true,
    this.error,
    this.isEmpty = false,
    this.isGame = false,
    this.previewModel,
    this.items = const [],
  });

  SectionMoreState copyWith({
    String? title,
    bool? isLoading,
    Object? error,
    bool? isEmpty,
    bool? isGame,
    ProductPreviewSectionUiModel? previewModel,
    List<CategoryItemUiModel>? items,
  }) {
    return SectionMoreState(
      title: title ?? this.title,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isEmpty: isEmpty ?? this.isEmpty,
      isGame: isGame ?? this.isGame,
      previewModel: previewModel ?? this.previewModel,
      items: items ?? this.items,
    );
  }
}
