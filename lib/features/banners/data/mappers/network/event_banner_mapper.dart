import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';

extension EventBannerMapper on EventBannerDto {
  EventBannerEntity toEntity(String locale) {
    final entity = EventBannerEntity(
      id: id,
      type: BannerType.event,
      imageAssetPath: imageAssetPath,
      title: title.display(locale),
      description: description.display(locale),
      topTooltipText: topToolTipText?.display(locale),
      eventId: eventId,
      eventCategory: eventCategory,
      eventDescription: eventDescription?.display(locale),
    );
    FeatureTalker.mapperOut(
      'banners.event_banner_mapper',
      'EventBannerDto -> EventBannerEntity',
      context: {'id': id, 'locale': locale},
    );
    return entity;
  }
}
