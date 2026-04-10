part of 'drift_banner_local_datasource.dart';

class _DriftBannerLocalReader {
  final AppDatabase _db;

  const _DriftBannerLocalReader(this._db);

  Future<List<LocalBannerBundle>> getBanners({
    required String type,
    required int page,
    required int pageSize,
  }) async {
    final safePage = page < 1 ? 1 : page;
    final safePageSize = pageSize < 1 ? 20 : pageSize;
    final offset = (safePage - 1) * safePageSize;

    final banners =
        await (_db.select(_db.cachedBanners)
              ..where((b) => b.type.equals(type))
              ..orderBy([(b) => OrderingTerm.desc(b.createdAt)])
              ..limit(safePageSize, offset: offset))
            .get();

    return _loadBundlesForBanners(banners);
  }

  Stream<List<LocalBannerBundle>> watchBanners({
    required String type,
    required int page,
    required int pageSize,
  }) {
    final safePage = page < 1 ? 1 : page;
    final safePageSize = pageSize < 1 ? 20 : pageSize;
    final offset = (safePage - 1) * safePageSize;

    final query =
        (_db.select(_db.cachedBanners)
              ..where((b) => b.type.equals(type))
              ..orderBy([(b) => OrderingTerm.desc(b.createdAt)])
              ..limit(safePageSize, offset: offset))
            .watch();
    return query.asyncMap(_loadBundlesForBanners);
  }

  Future<LocalBannerBundle?> getBannerById(String id) async {
    final banner = await (_db.select(
      _db.cachedBanners,
    )..where((b) => b.id.equals(id))).getSingleOrNull();

    if (banner == null) return null;
    return _buildBundle(banner);
  }

  Future<List<LocalBannerBundle>> _loadBundlesForBanners(
    List<CachedBanner> banners,
  ) {
    if (banners.isEmpty) return Future.value(const <LocalBannerBundle>[]);
    return Future.wait(banners.map(_buildBundle));
  }

  Future<LocalBannerBundle> _buildBundle(CachedBanner banner) async {
    final bannerId = banner.id;
    final event = banner.type == 'event'
        ? await (_db.select(
            _db.cachedEventBanners,
          )..where((e) => e.bannerId.equals(bannerId))).getSingleOrNull()
        : null;

    final action = banner.type == 'action'
        ? await (_db.select(
            _db.cachedActionBanners,
          )..where((a) => a.bannerId.equals(bannerId))).getSingleOrNull()
        : null;

    final translations = await (_db.select(
      _db.bannersTranslations,
    )..where((b) => b.bannerId.equals(bannerId))).get();

    return LocalBannerBundle(
      banner: banner,
      event: event,
      action: action,
      translations: translations,
    );
  }
}
