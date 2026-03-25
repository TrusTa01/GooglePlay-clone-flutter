import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/book_entity.dart';

extension BookMapper on BookDto {
  BookEntity toEntity() {
    return BookEntity(
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
      pageCount: pageCount.toString(),
      publisher: publisher,
      language: language,
      format: format,
      hasAudioVersion: hasAudioVersion,
      isSeries: isSeries,
      sampleAvailable: sampleAvailable,
      isAbridged: isAbridged,
      publicationDate: publicationDate,
    );
  }
}
