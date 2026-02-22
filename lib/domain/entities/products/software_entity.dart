import 'package:google_play/domain/entities/products/product_entity.dart';

abstract class SoftwareEntity extends ProductEntity {
  final List<String> screenshots; // URL скриншотов
  final String size; // Размер в MB
  final String version; // Версия приложения / игры
  final int downloadCount; // Количество загрузок
  final bool containsAds; // Содержит рекламу

  const SoftwareEntity({
    required super.type,
    required super.id,
    required super.title,
    required super.creator,
    required super.shortDescription,
    required super.description,
    required super.releaseDate,
    required super.rating,
    required super.reviewsCount,
    required super.iconUrl,
    required super.isPaid,
    required super.price,
    required super.creatorDescription,
    required super.url,
    required super.tags,
    required this.screenshots,
    required this.size,
    required this.version,
    required this.downloadCount,
    required this.containsAds,
  });

  @override
  String get technicalInfo => size;
}
