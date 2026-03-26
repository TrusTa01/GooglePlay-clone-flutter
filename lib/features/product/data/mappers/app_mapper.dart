import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/app_entity.dart';

extension AppMapper on AppDto {
  AppEntity toEntity(String locale) {
    return AppEntity(
      type: type,
      id: id,
      title: title.display(locale),
      creator: creator.display(locale),
      shortDescription: shortDescription.display(locale),
      description: description.display(locale),
      releaseDate: releaseDate,
      rating: rating,
      reviewsCount: reviewsCount,
      iconUrl: iconUrl,
      isPaid: isPaid,
      price: price,
      currencyCode: currencyCode,
      discountPrice: discountPrice,
      creatorDescription: creatorDescription.display(locale),
      url: url,
      tags: tags.map((t) => t.display(locale)).toList(),
      categories: categories.map((c) => c.display(locale)).toList(),
      screenshots: screenshots,
      size: size,
      version: version,
      downloadCount: downloadCount,
      containsAds: containsAds,
      containsPaidContent: containsPaidContent,
      eventText: eventText?.display(locale),
      whatsNewText: whatsNewText.display(locale),
      lastUpdated: lastUpdated,
      ageRating: ageRating,
      ageRatingReasons: ageRatingReasons.map((r) => r.display(locale)).toList(),
      permissions: permissions.map((p) => p.display(locale)).toList(),
      websiteUrl: websiteUrl,
      emailSupport: emailSupport,
      privacyPolicyUrl: privacyPolicyUrl,
      developerCompany: developerCompany.display(locale),
      developerAddress: developerAddress.display(locale),
      developerCity: developerCity.display(locale),
      developerCountry: developerCountry.display(locale),
      developerPhone: developerPhone,
    );
  }
}
