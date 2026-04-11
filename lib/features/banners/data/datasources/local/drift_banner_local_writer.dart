part of 'drift_banner_local_datasource.dart';

final class _DriftBannerLocalWriter extends BaseDriftWriter<BannerDto> {
  const _DriftBannerLocalWriter(super.db);

  @override
  Future<void> upsertOne(BannerDto dto) async {
    await dto.map(
      event: (e) async {
        await db.batch((batch) {
          batch.deleteWhere(
            db.cachedActionBanners,
            (t) => t.bannerId.equals(e.id),
          );
          batch.insertAllOnConflictUpdate(db.cachedBanners, [
            _baseBannerCompanion(e),
          ]);
          batch.insertAllOnConflictUpdate(db.cachedEventBanners, [
            CachedEventBannersCompanion.insert(
              bannerId: e.id,
              eventCategory: Value(e.eventCategory),
              eventDescription: Value(e.eventDescription),
              eventId: Value(e.eventId),
            ),
          ]);
        });
      },
      action: (a) async {
        await db.batch((batch) {
          batch.deleteWhere(
            db.cachedEventBanners,
            (t) => t.bannerId.equals(a.id),
          );
          batch.insertAllOnConflictUpdate(db.cachedBanners, [
            _baseBannerCompanion(a),
          ]);
          batch.insertAllOnConflictUpdate(db.cachedActionBanners, [
            CachedActionBannersCompanion.insert(
              bannerId: a.id,
              productExternalId: a.productExternalId,
            ),
          ]);
        });
      },
    );
  }

  CachedBannersCompanion _baseBannerCompanion(BannerDto dto) {
    return CachedBannersCompanion.insert(
      id: dto.id,
      title: Value(dto.title),
      topTooltipText: Value(dto.topToolTipText),
      description: Value(dto.description),
      type: dto.type,
      imageAssetPath: dto.imageAssetPath,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
