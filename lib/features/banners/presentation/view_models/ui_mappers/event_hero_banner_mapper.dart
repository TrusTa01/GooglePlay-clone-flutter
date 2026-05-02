import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/event_hero_banner_ui_model.dart';

class EventHeroBannerMapper {
  const EventHeroBannerMapper();

  EventHeroBannerUiModel fromEntity(EventBannerEntity banner) {
    final model = EventHeroBannerUiModel(
      imageAssetPath: banner.imageAssetPath,
      title: banner.title ?? '',
      hasTopTooltip: banner.topTooltipText != null,
      topTooltipText: banner.topTooltipText,
    );
    FeatureTalker.mapperOut(
      'banners.event_hero_banner_mapper',
      'EventHeroBannerUiModel',
      context: {'id': banner.id, 'hasTooltip': model.hasTopTooltip},
    );
    return model;
  }
}
