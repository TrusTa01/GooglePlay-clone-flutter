import 'package:flutter/material.dart';

class ActionRowUiModel {
  final String id;
  final String title;
  final String creator;
  final String ageLabel;
  final List<String> tags;
  final String thumbnailUrl;
  final double thumbnailBorderRadius;
  final double thumbnailWidth;
  final double thumbnailHeight;
  final int thumbnailCacheWidth;
  final int thumbnailCacheHeight;
  final BoxFit thumbnailFit;
  final String ratingText;
  final String? technicalInfoText;
  final String? eventText;
  final String? priceText;
  final bool isPaid;
  final bool isBook;
  final bool containsPaidContent;
  final bool showThreeLines;

  const ActionRowUiModel({
    required this.id,
    required this.title,
    required this.creator,
    required this.ageLabel,
    required this.tags,
    required this.thumbnailUrl,
    required this.thumbnailBorderRadius,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
    required this.thumbnailCacheWidth,
    required this.thumbnailCacheHeight,
    required this.thumbnailFit,
    required this.ratingText,
    this.technicalInfoText,
    this.eventText,
    this.priceText,
    required this.isPaid,
    required this.isBook,
    required this.containsPaidContent,
    required this.showThreeLines,
  });
}
