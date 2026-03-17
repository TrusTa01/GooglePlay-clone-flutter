import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';

class BannerItemUiModel {
  final String id;
  final String imageAssetPath;
  final String title;
  final String? topTooltipText;
  final String description;
  final String? productId;
  final ActionRowUiModel? actionRow;

  const BannerItemUiModel({
    required this.id,
    required this.imageAssetPath,
    required this.title,
    this.topTooltipText,
    required this.description,
    this.productId,
    this.actionRow,
  });
}
