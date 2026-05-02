import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

extension ActionBannerMapper on ActionBannerDto {
  ActionBannerEntity toEntity(String locale) {
    final entity = ActionBannerEntity(
      id: id,
      productExternalId: productExternalId,
      type: BannerType.action,
      imageAssetPath: imageAssetPath,
      title: title.display(locale),
      topTooltipText: topToolTipText?.display(locale),
      description: description.display(locale),
    );
    FeatureTalker.mapperOut(
      'banners.action_banner_mapper',
      'ActionBannerDto -> ActionBannerEntity',
      context: {'id': id, 'locale': locale},
    );
    return entity;
  }
}
