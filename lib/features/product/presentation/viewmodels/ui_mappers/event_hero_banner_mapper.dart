import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/event_hero_banner_ui_model.dart';

class EventHeroBannerMapper {
  const EventHeroBannerMapper();

  EventHeroBannerUiModel fromEntity(EventBannerEntity banner) {
    return EventHeroBannerUiModel(
      imageAssetPath: banner.imageAssetPath,
      title: banner.title,
      hasTopTooltip: banner.topToolTipText != null,
      topTooltipText: banner.topToolTipText,
    );
  }
}
