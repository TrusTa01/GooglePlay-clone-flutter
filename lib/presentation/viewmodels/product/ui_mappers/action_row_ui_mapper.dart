import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';

ActionRowUiModel fromState(
  ProductState state, {
  required bool showThreeLines,
}) {
  return ActionRowUiModel(
    id: state.productId ?? '',
    title: state.title,
    creator: state.creator,
    ageLabel: state.ageRating ?? '',
    tags: state.tags,
    thumbnailUrl: state.iconUrl,
    thumbnailBorderRadius: state.smallBorderRadius,
    thumbnailWidth: state.smallIconWidth,
    thumbnailHeight: state.smallIconHeight,
    thumbnailCacheWidth: state.smallCacheWidth,
    thumbnailCacheHeight: state.smallCacheHeight,
    thumbnailFit: state.thumbnailFit,
    ratingText: state.rating.toStringAsFixed(1),
    technicalInfoText: state.technicalInfoFormatted,
    eventText: state.eventText,
    priceText: state.price.isNotEmpty ? state.price : null,
    isPaid: state.isPaid,
    isBook: state.isBook,
    containsPaidContent: state.containsPaidContent,
    showThreeLines: showThreeLines,
  );
}
