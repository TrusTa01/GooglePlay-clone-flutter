part of 'drift_banner_local_datasource.dart';

final class _DriftBannerLocalWriter {
  final AppDatabase _db;

  const _DriftBannerLocalWriter(this._db);

  Future<void> upsertBanners(List<BannerDto> dtos) async {
    if (dtos.isEmpty) return;

    await _db.transaction(() async {
      for (final dto in dtos) {
        await _upsertOne(dto);
      }
    });
  }

  Future<void> _upsertOne(BannerDto dto) async {
    await _upsertBaseBanner(dto);
    await _replaceTranslations(dto);

    await dto.map(
      event: (e) async {
        await _upsertEventBanner(
          bannerId: e.id,
          eventCategory: e.eventCategory,
          eventDescription: e.eventDescription,
          eventId: e.eventId,
        );
        await _cleanupSubtypeTables(bannerId: e.id, keepType: 'event');
      },
      action: (a) async {
        await _upsertActionBanner(
          bannerId: a.id,
          productExternalId: a.productExternalId,
        );
        await _cleanupSubtypeTables(bannerId: a.id, keepType: 'action');
      },
    );
  }

  Future<void> _upsertBaseBanner(BannerDto dto) async {
    await _db
        .into(_db.cachedBanners)
        .insertOnConflictUpdate(
          CachedBannersCompanion.insert(
            id: dto.id,
            title: Value(dto.title),
            topTooltipText: Value(dto.topToolTipText),
            description: Value(dto.description),
            type: dto.type,
            imageAssetPath: dto.imageAssetPath,
            createdAt: dto.createdAt,
            updatedAt: dto.updatedAt,
          ),
        );
  }

  Future<void> _upsertEventBanner({
    required String bannerId,
    String? eventCategory,
    LocalizedString? eventDescription,
    String? eventId,
  }) async {
    await _db
        .into(_db.cachedEventBanners)
        .insertOnConflictUpdate(
          CachedEventBannersCompanion.insert(
            bannerId: bannerId,
            eventCategory: Value(eventCategory),
            eventDescription: Value(eventDescription),
            eventId: Value(eventId),
          ),
        );
  }

  Future<void> _upsertActionBanner({
    required String bannerId,
    required String productExternalId,
  }) async {
    await _db
        .into(_db.cachedActionBanners)
        .insertOnConflictUpdate(
          CachedActionBannersCompanion.insert(
            bannerId: bannerId,
            productExternalId: productExternalId,
          ),
        );
  }

  Future<void> _replaceTranslations(BannerDto dto) async {
    final bannerId = dto.id;
    await (_db.delete(
      _db.bannersTranslations,
    )..where((t) => t.bannerId.equals(bannerId))).go();

    final fields = _translationFields(dto);
    final rows = <BannersTranslationsCompanion>[];

    for (final entry in fields.entries) {
      final field = entry.key;
      final localized = entry.value;
      if (localized == null || localized.isEmpty) continue;

      for (final langEntry in localized.entries) {
        rows.add(
          BannersTranslationsCompanion.insert(
            bannerId: bannerId,
            field: field,
            language: langEntry.key,
            value: langEntry.value,
          ),
        );
      }
    }

    if (rows.isEmpty) return;
    await _db.batch((batch) {
      batch.insertAll(
        _db.bannersTranslations,
        rows,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Map<String, LocalizedString?> _translationFields(BannerDto dto) {
    final base = <String, LocalizedString?>{
      'title': dto.title,
      'description': dto.description,
      'top_tooltip_text': dto.topToolTipText,
    };

    return dto.map(
      event: (e) => <String, LocalizedString?>{
        ...base,
        'event_description': e.eventDescription,
      },
      action: (a) => <String, LocalizedString?>{...base},
    );
  }

  Future<void> _cleanupSubtypeTables({
    required String bannerId,
    required String keepType,
  }) async {
    if (keepType != 'event') {
      await (_db.delete(
        _db.cachedEventBanners,
      )..where((e) => e.bannerId.equals(bannerId))).go();
    }
    if (keepType != 'action') {
      await (_db.delete(
        _db.cachedActionBanners,
      )..where((a) => a.bannerId.equals(bannerId))).go();
    }
  }
}
