import 'package:flutter/material.dart';

class ProductCardUiModel {
  final String id;
  final String title;
  final String iconUrl;
  final String mainTagText;
  final String? mainTagIconPath;
  final double borderRadius;
  final double iconWidth;
  final double iconHeight;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit thumbnailFit;

  const ProductCardUiModel({
    required this.id,
    required this.title,
    required this.iconUrl,
    required this.mainTagText,
    this.mainTagIconPath,
    required this.borderRadius,
    required this.iconWidth,
    required this.iconHeight,
    required this.cacheWidth,
    required this.cacheHeight,
    required this.thumbnailFit,
  });
}
