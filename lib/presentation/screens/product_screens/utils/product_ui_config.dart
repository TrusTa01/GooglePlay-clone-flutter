import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/app_entity.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:google_play/domain/entities/products/game_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';

class ProductUIConfig {
  final ProductEntity product;

  ProductUIConfig(this.product);

  bool get isBook => product is BookEntity;

  String? get bookType {
    if (product is! BookEntity) return null;
    final format = (product as BookEntity).format.toLowerCase();
    return format.contains('аудио') ? 'аудио' : 'электронной';
  }

  String get titleText => isBook ? 'Об $bookType книге' : 'Описание';

  String get aboutTitleText {
    if (product is GameEntity) return 'Об игре';
    if (product is AppEntity) return 'Об приложении';
    if (product is BookEntity) return 'Об книге';
    return 'Об продукте';
  }

  // Размеры для основной страницы продукта
  double get iconWidth => isBook ? 80 : 60;
  double get iconHeight => isBook ? 120 : 60;
  int get cacheWidth => isBook ? 240 : 216;
  int get cacheHeight => isBook ? 360 : 216;

  // Уменьшенные размеры для DetailsScreen (AppBar)
  double get smallIconWidth => isBook ? 30 : 40;
  double get smallIconHeight => isBook ? 45 : 40;
  int get smallCacheWidth => isBook ? 90 : 120;
  int get smallCacheHeight => isBook ? 135 : 120;

  BorderRadius get borderRadius =>
      isBook ? BorderRadius.circular(8) : BorderRadius.circular(12);

  BorderRadius get smallBorderRadius =>
      isBook ? BorderRadius.circular(4) : BorderRadius.circular(8);
}
