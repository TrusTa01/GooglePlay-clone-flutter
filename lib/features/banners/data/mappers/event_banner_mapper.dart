import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';

extension EventBannerMapper on EventBannerDto {
  EventBannerEntity toEntity(String locale) {
    return EventBannerEntity(
      id: id,
      type: BannerType.event,
      imageAssetPath: imageAssetPath,
      title: title.display(locale),
      description: description.display(locale),
      topToolTipText: topToolTipText?.display(locale),
      eventId: eventId,
      eventCategory: eventCategory,
      eventDescription: eventDescription?.display(locale),
    );
  }
}
