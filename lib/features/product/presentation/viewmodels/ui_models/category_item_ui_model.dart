import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_card_ui_model.dart';

class CategoryItemUiModel {
  final String id;
  final bool isBook;
  final ProductCardUiModel card;

  const CategoryItemUiModel({
    required this.id,
    required this.isBook,
    required this.card,
  });
}
