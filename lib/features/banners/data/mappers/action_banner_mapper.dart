import 'package:google_play/features/banners/data/models/banner_dto.dart';
import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

extension ActionBannerMapper on ActionBannerDto {
  ActionBannerEntity toEntity(String locale) {
    return ActionBannerEntity(
      id: id,
      type: BannerType.action,
      imageAssetPath: imageAssetPath,
      title: title.display(locale),
      topToolTipText: topToolTipText?.display(locale),
      productId: productId,
      description: description.display(locale),
    );
  }
}
