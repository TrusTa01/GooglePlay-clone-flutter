import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/banners/action_banner_entity.dart';
import 'package:google_play/domain/entities/banners/banner_entity.dart';

extension ActionBannerMapper on ActionBannerDto {
  ActionBannerEntity toEntity() {
    return ActionBannerEntity(
      id: id,
      type: BannerType.action,
      imageAssetPath: imageAssetPath,
      title: title,
      topToolTipText: topToolTipText,
      productId: productId,
      description: description,
    );
  }
}
