import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/banner_item_ui_model.dart';

class BannerItemMapper {
  const BannerItemMapper();

  BannerItemUiModel fromEntity(
    BannerEntity banner, {
    ActionRowUiModel? actionRow,
  }) {
    return BannerItemUiModel(
      id: banner.id,
      imageAssetPath: banner.imageAssetPath,
      title: banner.title,
      topTooltipText: banner.topToolTipText,
      description: banner.description,
      productId: banner is ActionBannerEntity ? banner.productId : null,
      actionRow: actionRow,
    );
  }
}
