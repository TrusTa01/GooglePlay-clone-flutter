import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

class LocalBannerBundle {
  final CachedBanner banner;
  final CachedEventBanner? event;
  final CachedActionBanner? action;

  LocalBannerBundle({
    required this.banner,
    this.event,
    this.action,
  });

  BannerType get bannerType => switch (banner.type) {
    'event' => BannerType.event,
    'action' => BannerType.action,
    _ => BannerType.unknown,
  };
}
