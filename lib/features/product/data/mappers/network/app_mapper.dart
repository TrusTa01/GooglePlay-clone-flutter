import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/data/mappers/network/developer_mapper.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';

extension AppMapper on AppDto {
  AppEntity toEntity(String locale) {
    final entity = AppEntity(
      type: type,
      id: id,
      title: title.display(locale),
      creator: developer?.company.display(locale) ?? '',
      shortDescription: shortDescription.display(locale),
      description: description.display(locale),
      releaseDate: releaseDate,
      reviewsCount: reviewsCount,
      ratingAvg: ratingAvg,
      ratingDistribution: ratingDistribution,
      topReviews: topReviews,
      iconUrl: iconUrl,
      isPaid: isPaid,
      price: price,
      currencyCode: currencyCode,
      discountPrice: discountPrice,
      creatorDescription: creatorDescription.display(locale),
      url: url,
      tags: tags.map((t) => t.name.display(locale)).toList(),
      categories: categories.map((c) => c.name.display(locale)).toList(),
      screenshots: screenshots,
      size: size ?? '',
      version: version ?? '',
      downloadCount: downloadCount ?? 0,
      containsAds: containsAds ?? false,
      containsPaidContent: containsPaidContent ?? false,
      eventText: eventText?.display(locale),
      whatsNewText: whatsNewText?.display(locale) ?? '',
      lastUpdated: lastUpdated ?? DateTime.fromMillisecondsSinceEpoch(0),
      ageRating: ageRating ?? 0,
      isKidsFriendly: isKidsFriendly ?? false,
      ageRatingReasons:
          ageRatingReasons?.map((r) => r.display(locale)).toList() ?? const [],
      permissions:
          permissions?.map((p) => p.display(locale)).toList() ?? const [],
      supportedLanguages: supportedLanguages,
      developer: toDeveloperEntity(locale),
      packageName: packageName,
    );
    FeatureTalker.mapperOut(
      'product.app_mapper',
      'AppDto -> AppEntity',
      context: {'id': id, 'locale': locale, 'title': entity.title},
    );
    return entity;
  }
}
