import 'package:flutter/material.dart';
import 'package:google_play/models/models.dart';

class ProductUIConfig {
  final Product product;

  ProductUIConfig(this.product);

  bool get isBook => product is Book;

  String? get bookType => product is Book
      ? (product as Book).isEbook
            ? 'электронной'
            : 'аудио'
      : null;

  String get titleText => isBook ? 'Об $bookType книге' : 'Описание';
  String get aboutTitleText => switch (product) {
    Game() => 'Об игре',
    App() => 'Об приложении',
    Book() => 'Об книге',
    _ => 'Об продукте',
  };

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
