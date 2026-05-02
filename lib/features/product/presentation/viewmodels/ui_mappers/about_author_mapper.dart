import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_state.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/about_author_ui_model.dart';

/// Маппер из [ProductState] в UI‑модели
/// используемые на скрине AboutAuthor
class AboutAuthorMapper {
  const AboutAuthorMapper();

  AboutAuthorUiModel fromState(ProductState state) {
    final model = AboutAuthorUiModel(
      authorName: state.creator,
      authorDescription: state.creatorDescription ?? '',
    );
    FeatureTalker.mapperOut(
      'product.about_author_mapper',
      'ProductState -> AboutAuthorUiModel',
      context: {'id': state.id, 'authorName': model.authorName},
    );
    return model;
  }
}
