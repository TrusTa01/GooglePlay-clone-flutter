import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/models/local/local_product_bundle.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';
import 'package:google_play/features/product/domain/entities/developer_entity.dart';
import 'package:google_play/features/product/domain/entities/game_entity.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';

extension LocalProductBundleMapper on LocalProductBundle {
  ProductEntity? toEntity(String locale) {
    final product = this.product;
    final localizedTags = tags.map((t) => t.name.display(locale)).toList();
    final localizedCategories = categories
        .map((c) => c.name.display(locale))
        .toList();

    return switch (product.type) {
      'game' => _toGame(
        locale: locale,
        localizedTags: localizedTags,
        localizedCategories: localizedCategories,
      ),
      'app' => _toApp(
        locale: locale,
        localizedTags: localizedTags,
        localizedCategories: localizedCategories,
      ),
      'book' => _toBook(
        locale: locale,
        localizedTags: localizedTags,
        localizedCategories: localizedCategories,
      ),
      _ => null,
    };
  }

  ProductEntity? _toGame({
    required String locale,
    required List<String> localizedTags,
    required List<String> localizedCategories,
  }) {
    final software = this.software;
    final game = this.game;
    final developer = this.developer;
    if (software == null || game == null || developer == null) return null;

    return GameEntity(
      type: product.type,
      id: product.id,
      title: product.title.display(locale),
      creator: developer.company.display(locale),
      shortDescription: product.shortDescription.display(locale),
      description: product.description.display(locale),
      releaseDate: product.releaseDate,
      rating: product.rating,
      reviewsCount: product.reviewsCount,
      ratingAvg: product.ratingAvg,
      ratingDistribution: product.ratingDistribution,
      topReviews: product.topReviews,
      iconUrl: product.iconUrl,
      isPaid: product.isPaid,
      price: product.price,
      currencyCode: product.currencyCode,
      discountPrice: product.discountPrice,
      creatorDescription: (software.creatorDescription ?? const {}).display(
        locale,
      ),
      url: product.url,
      tags: localizedTags,
      categories: localizedCategories,
      screenshots: software.screenshots ?? const [],
      size: software.size,
      version: software.version,
      downloadCount: software.downloadCount,
      containsAds: software.containsAds,
      containsPaidContent: software.containsPaidContent,
      eventText: software.eventText?.display(locale),
      whatsNewText: software.whatsNewText.display(locale),
      lastUpdated: software.lastUpdated,
      ageRating: software.ageRating,
      isKidsFriendly: software.isKidsFriendly,
      ageRatingReasons: _localizedList(software.ageRatingReasons, locale),
      permissions: _localizedList(software.permissions, locale),
      supportedLanguages: software.supportedLanguages ?? const [],
      developer: _toDeveloperEntity(developer, locale),
      achievements: _localizedList(game.achievements, locale),
      isOnline: game.isOnline,
      hasMultiplayer: game.hasMultiplayer,
      gameModes: game.gameModes,
      hasControllerSupport: game.hasControllerSupport,
    );
  }

  ProductEntity? _toApp({
    required String locale,
    required List<String> localizedTags,
    required List<String> localizedCategories,
  }) {
    final software = this.software;
    final app = this.app;
    final developer = this.developer;
    if (software == null || app == null || developer == null) return null;

    return AppEntity(
      type: product.type,
      id: product.id,
      title: product.title.display(locale),
      creator: developer.company.display(locale),
      shortDescription: product.shortDescription.display(locale),
      description: product.description.display(locale),
      releaseDate: product.releaseDate,
      rating: product.rating,
      reviewsCount: product.reviewsCount,
      ratingAvg: product.ratingAvg,
      ratingDistribution: product.ratingDistribution,
      topReviews: product.topReviews,
      iconUrl: product.iconUrl,
      isPaid: product.isPaid,
      price: product.price,
      currencyCode: product.currencyCode,
      discountPrice: product.discountPrice,
      creatorDescription: (software.creatorDescription ?? const {}).display(
        locale,
      ),
      url: product.url,
      tags: localizedTags,
      categories: localizedCategories,
      screenshots: software.screenshots ?? const [],
      size: software.size,
      version: software.version,
      downloadCount: software.downloadCount,
      containsAds: software.containsAds,
      containsPaidContent: software.containsPaidContent,
      eventText: software.eventText?.display(locale),
      whatsNewText: software.whatsNewText.display(locale),
      lastUpdated: software.lastUpdated,
      ageRating: software.ageRating,
      isKidsFriendly: software.isKidsFriendly,
      ageRatingReasons: _localizedList(software.ageRatingReasons, locale),
      permissions: _localizedList(software.permissions, locale),
      supportedLanguages: software.supportedLanguages ?? const [],
      developer: _toDeveloperEntity(developer, locale),
      packageName: app.packageName,
    );
  }

  ProductEntity? _toBook({
    required String locale,
    required List<String> localizedTags,
    required List<String> localizedCategories,
  }) {
    final book = this.book;
    final publisher = this.publisher;
    if (book == null || publisher == null) return null;

    return BookEntity(
      type: product.type,
      id: product.id,
      title: product.title.display(locale),
      creator: publisher.publisher.display(locale),
      shortDescription: product.shortDescription.display(locale),
      description: product.description.display(locale),
      releaseDate: product.releaseDate,
      rating: product.rating,
      reviewsCount: product.reviewsCount,
      ratingAvg: product.ratingAvg,
      ratingDistribution: product.ratingDistribution,
      topReviews: product.topReviews,
      iconUrl: product.iconUrl,
      isPaid: product.isPaid,
      price: product.price,
      currencyCode: product.currencyCode,
      discountPrice: product.discountPrice,
      creatorDescription: publisher.description.display(locale),
      url: product.url,
      tags: localizedTags,
      categories: localizedCategories,
      pageCount: book.pageCount,
      publisher: publisher.publisher.display(locale),
      language: book.language,
      format: book.format,
      hasAudioVersion: book.hasAudioVersion,
      audioDuration: book.audioDuration,
      narrator: book.narrator,
      isSeries: book.isSeries,
      seriesName: book.seriesName,
      seriesNumber: book.seriesNumber,
      sampleAvailable: book.sampleAvailable,
      isAbridged: book.isAbridged,
      publicationDate: book.publicationDate,
      awards: book.awards ?? const [],
    );
  }
}

DeveloperEntity _toDeveloperEntity(Developer developer, String locale) =>
    DeveloperEntity(
      company: developer.company.display(locale),
      address: developer.address.display(locale),
      city: developer.city.display(locale),
      country: developer.country.display(locale),
      phone: developer.phone,
      websiteUrl: developer.websiteUrl,
      emailSupport: developer.emailSupport,
      privacyPolicyUrl: developer.privacyPolicyUrl,
    );

List<String> _localizedList(List<Map<String, String>>? values, String locale) {
  if (values == null || values.isEmpty) return const [];
  return values.map((entry) => entry.display(locale)).toList();
}
