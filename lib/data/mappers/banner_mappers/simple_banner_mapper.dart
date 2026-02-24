import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/banners/banner_entity.dart';
import 'package:google_play/domain/entities/banners/simple_banner_entity.dart';

extension SimpleBannerMapper on SimpleBannerDto {
  SimpleBannerEntity toEntity() {
    return SimpleBannerEntity(
      id: id,
      type: BannerType.simple,
      imageAssetPath: imageAssetPath,
      title: title,
      description: description,
      topToolTipText: topToolTipText,
    );
  }
}
