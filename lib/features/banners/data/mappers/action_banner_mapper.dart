import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

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
