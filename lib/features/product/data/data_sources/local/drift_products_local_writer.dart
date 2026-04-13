part of 'drift_products_local_data_source.dart';

final class _ProductLocalWriter extends BaseDriftWriter<ProductDto> {
  const _ProductLocalWriter(super._db);

  @override
  Future<void> upsertOne(ProductDto dto) async {
    await _upsertBaseProduct(dto);
    await _replaceTranslations(dto);
    await _replaceCategories(dto.id, dto.categories);
    await _replaceTags(dto.id, dto.tags);

    await dto.map(
      game: (g) async {
        await _upsertDeveloper(g.developer);
        await _upsertSoftwareCommon(
          productId: g.id,
          developerId: g.developer.id,
          screenshots: g.screenshots,
          supportedLanguages: g.supportedLanguages,
          containsAds: g.containsAds,
          containsPaidContent: g.containsPaidContent,
          version: g.version,
          size: g.size,
          eventText: g.eventText,
          whatsNewText: g.whatsNewText,
          downloadCount: g.downloadCount,
          ageRating: g.ageRating,
          isKidsFriendly: g.isKidsFriendly,
          ageRatingReasons: g.ageRatingReasons,
          permissions: g.permissions,
          lastUpdated: g.lastUpdated,
          creatorDescription: g.creatorDescription,
        );
        await _upsertGame(g);
        await _cleanupSubtypeTables(productId: g.id, keepType: 'game');
      },
      app: (a) async {
        await _upsertDeveloper(a.developer);
        await _upsertSoftwareCommon(
          productId: a.id,
          developerId: a.developer.id,
          screenshots: a.screenshots,
          supportedLanguages: a.supportedLanguages,
          containsAds: a.containsAds,
          containsPaidContent: a.containsPaidContent,
          version: a.version,
          size: a.size,
          eventText: a.eventText,
          whatsNewText: a.whatsNewText,
          downloadCount: a.downloadCount,
          ageRating: a.ageRating,
          isKidsFriendly: a.isKidsFriendly,
          ageRatingReasons: a.ageRatingReasons,
          permissions: a.permissions,
          lastUpdated: a.lastUpdated,
          creatorDescription: a.creatorDescription,
        );
        await _upsertApp(a);
        await _cleanupSubtypeTables(productId: a.id, keepType: 'app');
      },
      book: (b) async {
        await _upsertPublisher(b.publisher);
        await _upsertBook(b);
        await _cleanupSubtypeTables(productId: b.id, keepType: 'book');
      },
    );
  }

  Future<void> _upsertBaseProduct(ProductDto dto) async {
    await db
        .into(db.cachedProduct)
        .insertOnConflictUpdate(
          CachedProductCompanion.insert(
            id: dto.id,
            externalId: dto.externalId,
            type: dto.type,
            title: dto.title,
            shortDescription: dto.shortDescription,
            description: dto.description,
            rating: dto.rating,
            releaseDate: dto.releaseDate,
            iconUrl: dto.iconUrl,
            isPaid: dto.isPaid,
            price: Value(dto.price),
            currencyCode: dto.currencyCode,
            discountPrice: Value(dto.discountPrice),
            url: dto.url,
            reviewsCount: dto.reviewsCount,
            ratingAvg: dto.ratingAvg,
            ratingDistribution: dto.ratingDistribution,
            topReviews: dto.topReviews,
          ),
        );
  }

  Future<void> _upsertSoftwareCommon({
    required String productId,
    required String developerId,
    required List<String> screenshots,
    required List<String> supportedLanguages,
    required bool containsAds,
    required bool containsPaidContent,
    required String version,
    required String size,
    required LocalizedString? eventText,
    required LocalizedString whatsNewText,
    required int downloadCount,
    required int ageRating,
    required bool isKidsFriendly,
    required List<LocalizedString> ageRatingReasons,
    required List<LocalizedString> permissions,
    required DateTime lastUpdated,
    required LocalizedString creatorDescription,
  }) async {
    await db
        .into(db.cachedSoftwareProduct)
        .insertOnConflictUpdate(
          CachedSoftwareProductCompanion.insert(
            productId: productId,
            developerId: developerId,
            screenshots: Value(screenshots.isEmpty ? null : screenshots),
            supportedLanguages: Value(
              supportedLanguages.isEmpty ? null : supportedLanguages,
            ),
            containsAds: containsAds,
            containsPaidContent: containsPaidContent,
            version: version,
            size: size,
            eventText: Value(eventText),
            whatsNewText: whatsNewText,
            downloadCount: downloadCount,
            ageRating: ageRating,
            isKidsFriendly: isKidsFriendly,
            ageRatingReasons: Value(
              ageRatingReasons.isEmpty ? null : ageRatingReasons,
            ),
            permissions: Value(permissions.isEmpty ? null : permissions),
            lastUpdated: lastUpdated,
            creatorDescription: Value(creatorDescription),
          ),
        );
  }

  Future<void> _upsertApp(AppDto a) async {
    await db
        .into(db.cachedApps)
        .insertOnConflictUpdate(
          CachedAppsCompanion.insert(
            productId: a.id,
            packageName: a.packageName,
          ),
        );
  }

  Future<void> _upsertGame(GameDto g) async {
    await db
        .into(db.cachedGames)
        .insertOnConflictUpdate(
          CachedGamesCompanion.insert(
            productId: g.id,
            technicalInfo: Value(g.technicalInfo),
            isOnline: Value(g.isOnline),
            hasMultiplayer: Value(g.hasMultiplayer),
            gameModes: Value(g.gameModes),
            hasControllerSupport: Value(g.hasControllerSupport),
            achievements: Value(g.achievements.isEmpty ? null : g.achievements),
          ),
        );
  }

  Future<void> _upsertBook(BookDto b) async {
    await db
        .into(db.cachedBooks)
        .insertOnConflictUpdate(
          CachedBooksCompanion.insert(
            productId: b.id,
            publisherId: b.publisher.id,
            pageCount: b.pageCount,
            language: b.language,
            format: b.format,
            hasAudioVersion: b.hasAudioVersion,
            audioDuration: Value(b.audioDuration),
            narrator: Value(b.narrator),
            isSeries: b.isSeries,
            seriesName: Value(b.seriesName),
            seriesNumber: Value(b.seriesNumber),
            sampleAvailable: b.sampleAvailable,
            isAbridged: b.isAbridged,
            publicationDate: b.publicationDate,
            awards: Value(b.awards.isEmpty ? null : b.awards),
          ),
        );
  }

  Future<void> _upsertDeveloper(DeveloperDto d) async {
    await db
        .into(db.developers)
        .insertOnConflictUpdate(
          DevelopersCompanion.insert(
            id: d.id,
            city: d.city,
            phone: d.phone,
            address: d.address,
            company: d.company,
            country: d.country,
            websiteUrl: d.websiteUrl,
            emailSupport: d.emailSupport,
            privacyPolicyUrl: d.privacyPolicyUrl,
          ),
        );
  }

  Future<void> _upsertPublisher(BookPublisherDto p) async {
    await db
        .into(db.publishers)
        .insertOnConflictUpdate(
          PublishersCompanion.insert(
            id: p.id,
            publisher: p.name,
            description: p.description,
          ),
        );
  }

  Future<void> _cleanupSubtypeTables({
    required String productId,
    required String keepType,
  }) async {
    if (keepType != 'app') {
      await (db.delete(
        db.cachedApps,
      )..where((t) => t.productId.equals(productId))).go();
    }

    if (keepType != 'game') {
      await (db.delete(
        db.cachedGames,
      )..where((t) => t.productId.equals(productId))).go();
    }

    if (keepType != 'book') {
      await (db.delete(
        db.cachedBooks,
      )..where((t) => t.productId.equals(productId))).go();
    }

    if (keepType == 'book') {
      await (db.delete(
        db.cachedSoftwareProduct,
      )..where((t) => t.productId.equals(productId))).go();
    }
  }

  Future<void> _replaceTranslations(ProductDto dto) async {
    final productId = dto.id;
    await (db.delete(
      db.productTranslations,
    )..where((t) => t.productId.equals(productId))).go();

    final fields = _translationFields(dto);
    final rows = <ProductTranslationsCompanion>[];

    for (final entry in fields.entries) {
      final field = entry.key;
      final localized = entry.value;
      if (localized == null || localized.isEmpty) continue;

      for (final langEntry in localized.entries) {
        rows.add(
          ProductTranslationsCompanion.insert(
            productId: productId,
            field: field,
            language: langEntry.key,
            value: langEntry.value,
          ),
        );
      }
    }

    if (rows.isEmpty) return;
    await db.batch((batch) {
      batch.insertAll(
        db.productTranslations,
        rows,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Map<String, LocalizedString?> _translationFields(ProductDto dto) {
    final base = <String, LocalizedString?>{
      'title': dto.title,
      'short_description': dto.shortDescription,
      'description': dto.description,
    };

    return dto.map(
      game: (g) => <String, LocalizedString?>{
        ...base,
        'event_text': g.eventText,
        'whats_new_text': g.whatsNewText,
        'creator_description': g.creatorDescription,
      },
      app: (a) => <String, LocalizedString?>{
        ...base,
        'event_text': a.eventText,
        'whats_new_text': a.whatsNewText,
        'creator_description': a.creatorDescription,
      },
      book: (b) => <String, LocalizedString?>{
        ...base,
        'publisher_name': b.publisher.name,
        'publisher_description': b.publisher.description,
      },
    );
  }

  Future<void> _replaceCategories(
    String productId,
    List<CategoryDto> categories,
  ) async {
    await (db.delete(
      db.productCategories,
    )..where((t) => t.productId.equals(productId))).go();

    if (categories.isEmpty) return;
    final seen = <String>{};
    final categoryRows = <CategoriesCompanion>[];
    final junctionRows = <ProductCategoriesCompanion>[];

    for (final category in categories) {
      if (!seen.add(category.id)) continue;

      categoryRows.add(
        CategoriesCompanion.insert(
          id: category.id,
          name: category.name,
          type: 'product',
        ),
      );

      junctionRows.add(
        ProductCategoriesCompanion.insert(
          productId: productId,
          categoryId: category.id,
        ),
      );
    }

    await db.batch((batch) {
      batch.insertAll(
        db.categories,
        categoryRows,
        mode: InsertMode.insertOrReplace,
      );

      batch.insertAll(
        db.productCategories,
        junctionRows,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> _replaceTags(String productId, List<TagDto> tags) async {
    await (db.delete(
      db.productTags,
    )..where((t) => t.productId.equals(productId))).go();

    if (tags.isEmpty) return;
    final seen = <String>{};
    final tagsRows = <TagsCompanion>[];
    final junctionRows = <ProductTagsCompanion>[];

    for (final tag in tags) {
      if (!seen.add(tag.id)) continue;
      tagsRows.add(
        TagsCompanion.insert(id: tag.id, name: tag.name, type: 'product'),
      );

      junctionRows.add(
        ProductTagsCompanion.insert(productId: productId, tagId: tag.id),
      );
    }
    await db.batch((batch) {
      batch.insertAll(db.tags, tagsRows, mode: InsertMode.insertOrReplace);
      batch.insertAll(
        db.productTags,
        junctionRows,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
