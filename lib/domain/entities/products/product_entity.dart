import 'package:google_play/domain/entities/base_entity.dart';

abstract class ProductEntity extends Entity {
  final String type; // app, game, book
  final String title;
  final String creator; // Автор / разработчик
  final String shortDescription;
  final String description;
  final DateTime releaseDate;
  final double rating;
  final int? reviewsCount; // Количество отзывов
  final String iconUrl;
  final bool isPaid;
  final double? price;
  final String creatorDescription; // Описание автора / разработчика
  final String url;
  final List<String> tags;
  String get technicalInfo; // Размер (MB), кол-во страниц и т.д.

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
    required this.creatorDescription,
    required this.url,
    required this.tags,
  });
}
