// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product_models/book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  id: json['id'] as String,
  title: json['title'] as String,
  creator: json['creator'] as String,
  rating: (json['rating'] as num).toDouble(),
  category: json['category'] as String,
  iconUrl: json['iconUrl'] as String,
  isPaid: json['isPaid'] as bool,
  publisher: json['publisher'] as String,
  isbn: json['isbn'] as String,
  pageCount: (json['pageCount'] as num).toInt(),
  language: json['language'] as String,
  publicationDate: DateTime.parse(json['publicationDate'] as String),
  description: json['description'] as String,
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  hasAudioVersion: json['hasAudioVersion'] as bool,
  audioDuration: json['audioDuration'] == null
      ? null
      : Duration(microseconds: (json['audioDuration'] as num).toInt()),
  narrator: json['narrator'] as String,
  isSeries: json['isSeries'] as bool,
  seriesName: json['seriesName'] as String?,
  seriesNumber: (json['seriesNumber'] as num?)?.toInt(),
  sampleAvailable: json['sampleAvailable'] as bool,
  isOnSale: json['isOnSale'] as bool,
  originalPrice: (json['originalPrice'] as num?)?.toDouble(),
  awards: (json['awards'] as List<dynamic>).map((e) => e as String).toList(),
  price: json['price'] as String?,
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'creator': instance.creator,
  'rating': instance.rating,
  'category': instance.category,
  'iconUrl': instance.iconUrl,
  'isPaid': instance.isPaid,
  'price': instance.price,
  'publisher': instance.publisher,
  'isbn': instance.isbn,
  'pageCount': instance.pageCount,
  'language': instance.language,
  'publicationDate': instance.publicationDate.toIso8601String(),
  'description': instance.description,
  'genres': instance.genres,
  'hasAudioVersion': instance.hasAudioVersion,
  'audioDuration': instance.audioDuration?.inMicroseconds,
  'narrator': instance.narrator,
  'isSeries': instance.isSeries,
  'seriesName': instance.seriesName,
  'seriesNumber': instance.seriesNumber,
  'sampleAvailable': instance.sampleAvailable,
  'isOnSale': instance.isOnSale,
  'originalPrice': instance.originalPrice,
  'awards': instance.awards,
};
