import '../product_interface.dart';

import 'package:json_annotation/json_annotation.dart';

part '../product_models.g/book_model.g.dart';

@JsonSerializable()
class Book implements Product {
  @override
  final String type;
  @override
  final String id;
  @override
  final String title;
  @override
  final String creator;
  @override
  final String description;
  @override
  final double rating;
  @override
  final String iconUrl;
  @override
  final bool isPaid; 
  @override
  final double? price;
  @override
  String get technicalInfo => '$pageCount';

  final String publisher; // Издательство
  final String isbn; // "978-5-389-12345-6"
  final int pageCount; // 320
  final String language; // "Русский"
  // final BookFormat format; // enum: ePub, PDF, Audiobook
  final DateTime publicationDate; // Дата публикации
  final List<String> genres; // ["Фэнтези", "Приключения"]
  final bool hasAudioVersion; // Есть аудиокнига
  final Duration? audioDuration; // Продолжительность аудио
  final String narrator; // Чтец (для аудиокниг)
  final bool isSeries; // Часть серии
  final String? seriesName; // Название серии
  final int? seriesNumber; // Номер в серии
  final bool sampleAvailable; // Есть бесплатный фрагмент
  final bool isOnSale; // Со скидкой
  final double? originalPrice; // Цена без скидки
  final List<String> awards;

  Book({
    required this.type,
    required this.id,
    required this.title,
    required this.creator,
    required this.rating,
    required this.iconUrl,
    required this.isPaid,
    required this.publisher,
    required this.isbn,
    required this.pageCount,
    required this.language,
    // required this.format,
    required this.publicationDate,
    required this.description,
    required this.genres,
    required this.hasAudioVersion,
    required this.audioDuration,
    required this.narrator,
    required this.isSeries,
    required this.seriesName,
    required this.seriesNumber,
    required this.sampleAvailable,
    required this.isOnSale,
    required this.originalPrice,
    required this.awards,
    this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
