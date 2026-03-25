import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/simple_banner_entity.dart';

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
