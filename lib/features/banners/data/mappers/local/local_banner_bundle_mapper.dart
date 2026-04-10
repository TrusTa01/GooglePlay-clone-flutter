import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';

extension LocalBannerBundleMapper on LocalBannerBundle {
  BannerEntity? toEntity(String locale) {
    return switch (bannerType) {
      BannerType.event => _toEvent(locale: locale),
      BannerType.action => _toAction(locale: locale),
      _ => null,
    };
  }

  BannerEntity? _toEvent({required String locale}) {
    final event = this.event;
    if (event == null) return null;

    return EventBannerEntity(
      id: banner.id,
      type: BannerType.event,
      imageAssetPath: banner.imageAssetPath,
      title: banner.title?.display(locale),
      topTooltipText: banner.topTooltipText?.display(locale),
      description: banner.description?.display(locale),
      eventId: event.eventId,
      eventCategory: event.eventCategory,
      eventDescription: event.eventDescription?.display(locale),
    );
  }

  BannerEntity? _toAction({required String locale}) {
    final action = this.action;
    if (action == null) return null;

    return ActionBannerEntity(
      id: banner.id,
      type: BannerType.action,
      imageAssetPath: banner.imageAssetPath,
      title: banner.title?.display(locale),
      topTooltipText: banner.topTooltipText?.display(locale),
      description: banner.description?.display(locale),
      productExternalId: action.productExternalId,
    );
  }
}
