import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/simple_banner_entity.dart';

extension SimpleBannerMapper on SimpleBannerDto {
  SimpleBannerEntity toEntity(String locale) {
    return SimpleBannerEntity(
      id: id,
      type: BannerType.simple,
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
