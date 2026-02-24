import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/books/book_entity.dart';

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
      creatorDescription: creatorDescription,
      url: url,
      tags: tags,
      pageCount: pageCount.toString(),
      publisher: publisher,
      language: language,
      format: format,
      hasAudioVersion: hasAudioVersion,
      isSeries: isSeries,
      sampleAvailable: sampleAvailable,
      isAbridged: isAbridged,
      publicationDate: publicationDate,
      categories: categories,
    );
  }
}
