import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/domain/entities/products/game_entity.dart';

extension GameMapper on GameDto {
  GameEntity toEntity() {
    return GameEntity(
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
      screenshots: screenshots,
      size: size,
      version: version,
      downloadCount: downloadCount,
      containsAds: containsAds,
    );
  }
}
