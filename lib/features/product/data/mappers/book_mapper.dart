import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';

extension BookMapper on BookDto {
  BookEntity toEntity(String locale) {
    return BookEntity(
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
      pageCount: pageCount,
      publisher: publisher.display(locale),
      language: language,
      format: format,
      hasAudioVersion: hasAudioVersion,
      audioDuration: audioDuration,
      narrator: narrator,
      isSeries: isSeries,
      seriesName: seriesName,
      seriesNumber: seriesNumber,
      sampleAvailable: sampleAvailable,
      isAbridged: isAbridged,
      publicationDate: publicationDate,
      awards: awards,
    );
  }
}
