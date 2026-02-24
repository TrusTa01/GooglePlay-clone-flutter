import 'package:google_play/domain/entities/products/product_entity.dart';

final class BookEntity extends ProductEntity {
  final String publisher; // Издатель
  final String pageCount; // Кол-во страниц
  final String language; // Язык
  final String format; // Формат
  final bool hasAudioVersion; // Есть аудиокнига
  final int? audioDuration; // Продолжительность аудио в секундах
  final String? narrator; // Чтец (для аудиокниг)
  final bool isSeries; // Часть серии
  final String? seriesName; // Название серии
  final int? seriesNumber; // Номер в серии
  final bool sampleAvailable; // Есть бесплатный фрагмент
  final bool isAbridged; // Сокращенное издание
  final DateTime publicationDate; // Дата публикации
  final List<String> categories; // ["Фэнтези", "Приключения"]

  BookEntity({
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
    required this.pageCount,
    required this.publisher,
    required this.language,
    required this.format,
    required this.hasAudioVersion,
    this.audioDuration,
    this.narrator,
    required this.isSeries,
    this.seriesName,
    this.seriesNumber,
    required this.sampleAvailable,
    required this.isAbridged,
    required this.publicationDate,
    required this.categories,
  });

  @override
  String get technicalInfo => pageCount;
}
