import 'package:google_play/features/banners/domain/entities/simple_banner_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/event_hero_banner_ui_model.dart';

class EventHeroBannerMapper {
  const EventHeroBannerMapper();

  EventHeroBannerUiModel fromEntity(SimpleBannerEntity banner) {
    return EventHeroBannerUiModel(
      imageAssetPath: banner.imageAssetPath,
      title: banner.title,
      hasTopTooltip: banner.topToolTipText != null,
      topTooltipText: banner.topToolTipText,
    );
  }
}
