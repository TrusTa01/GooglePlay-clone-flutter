import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';

class ActionRowUiMapper {
  const ActionRowUiMapper();

  ActionRowUiModel fromStateGrid(ProductState state) {
    final model = ActionRowUiModel(
      id: state.id,
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
      ratingText: state.ratingAvgText,
      technicalInfoText: state.technicalInfoFormatted,
      eventText: state.eventText,
      priceText: state.price.isNotEmpty ? state.price : null,
      isPaid: state.isPaid,
      isBook: state.isBook,
      containsPaidContent: state.containsPaidContent,
      showThreeLines: true,
    );
    FeatureTalker.mapperOut(
      'product.action_row_ui_mapper',
      'ProductState -> ActionRowUiModel(grid)',
      context: {'id': state.id, 'isPaid': state.isPaid, 'isBook': state.isBook},
    );
    return model;
  }

  ActionRowUiModel fromStatePreview(ProductState state) {
    final model = ActionRowUiModel(
      id: state.id,
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
      ratingText: state.ratingAvgText,
      technicalInfoText: state.technicalInfoFormatted,
      eventText: state.eventText,
      priceText: state.price.isNotEmpty ? state.price : null,
      isPaid: state.isPaid,
      isBook: state.isBook,
      containsPaidContent: state.containsPaidContent,
      showThreeLines: false,
    );
    FeatureTalker.mapperOut(
      'product.action_row_ui_mapper',
      'ProductState -> ActionRowUiModel(preview)',
      context: {'id': state.id, 'isPaid': state.isPaid, 'isBook': state.isBook},
    );
    return model;
  }
}
