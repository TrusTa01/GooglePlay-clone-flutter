import 'package:google_play/core/domain/entities/base_entity.dart';

abstract class ProductEntity extends Entity {
  final String type;
  final String title;
  final String creator;
  final String shortDescription;
  final String description;
  final DateTime releaseDate;
  final double rating;
  final int reviewsCount;
  final String iconUrl;
  final bool isPaid;
  final double? price;
  final String currencyCode;
  final double? discountPrice;
  final String creatorDescription;
  final String url;
  final List<String> tags;
  final List<String> categories;
  String get technicalInfo;

  const ProductEntity({
    required super.id,
    required this.type,
    required this.title,
    required this.creator,
    required this.shortDescription,
    required this.description,
    required this.releaseDate,
    required this.rating,
    required this.reviewsCount,
    required this.iconUrl,
    required this.isPaid,
    required this.price,
    this.currencyCode = 'USD',
    this.discountPrice,
    required this.creatorDescription,
    required this.url,
    required this.tags,
    required this.categories,
  });
}
