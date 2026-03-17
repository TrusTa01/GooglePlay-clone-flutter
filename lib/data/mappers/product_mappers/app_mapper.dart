import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/app_entity.dart';

extension AppMapper on AppDto {
  AppEntity toEntity() {
    return AppEntity(
      type: type,
      id: id,
      title: title,
      creator: creator,
      shortDescription: shortDescription,
      description: description,
      releaseDate: releaseDate,
      rating: rating,
      reviewsCount: reviewsCount,
      iconUrl: iconUrl,
      isPaid: isPaid,
      price: price,
      currencyCode: currencyCode,
      discountPrice: discountPrice,
      creatorDescription: creatorDescription,
      url: url,
      tags: tags,
      categories: categories,
      screenshots: screenshots,
      size: size,
      version: version,
      downloadCount: downloadCount,
      containsAds: containsAds,
      containsPaidContent: containsPaidContent,
      eventText: eventText,
      whatsNewText: whatsNewText,
      lastUpdated: lastUpdated,
      ageRating: ageRating,
      ageRatingReasons: ageRatingReasons,
      permissions: permissions,
      websiteUrl: websiteUrl,
      emailSupport: emailSupport,
      privacyPolicyUrl: privacyPolicyUrl,
      developerCompany: developerCompany,
      developerAddress: developerAddress,
      developerCity: developerCity,
      developerCountry: developerCountry,
      developerPhone: developerPhone,
    );
  }
}
