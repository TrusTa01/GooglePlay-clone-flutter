import 'package:google_play/core/local_database/app_database.dart';

class LocalBannerBundle {
  final CachedBanner banner;
  final CachedEventBanner? event;
  final CachedActionBanner? action;
  final List<BannersTranslation> translations;

  LocalBannerBundle({
    required this.banner,
    this.event,
    this.action,
    required this.translations,
  });
}
