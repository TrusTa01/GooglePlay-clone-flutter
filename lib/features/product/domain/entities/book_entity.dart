import 'package:google_play/features/product/domain/entities/product_entity.dart';

final class BookEntity extends ProductEntity {
  final String publisher; // Издатель
  final int pageCount; // Кол-во страниц
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
  final List<String> awards; // Награды

  const BookEntity({
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
    super.currencyCode = 'USD',
    super.discountPrice,
    required super.creatorDescription,
    required super.url,
    required super.tags,
    required super.categories,
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
    this.awards = const [],
  });

  /// Жанры книги (то же, что [ProductEntity.categories]; алиас для ясности в контексте книг)
  List<String> get genres => categories;

  /// Электронная книга (не аудио)
  bool get isEbook => !format.toLowerCase().contains('аудио');

  @override
  String get technicalInfo => pageCount.toString();
}
