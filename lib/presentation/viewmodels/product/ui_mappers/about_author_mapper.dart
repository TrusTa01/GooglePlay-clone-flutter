import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/about_author_ui_model.dart';

/// Маппер из [ProductState] в UI‑модели
/// используемые на скрине AboutAuthor
class AboutAuthorMapper {
  const AboutAuthorMapper();

  AboutAuthorUiModel fromState(ProductState state) {
    return AboutAuthorUiModel(
      authorName: state.creator,
      authorDescription: state.creatorDescription ?? '',
    );
  }
}
