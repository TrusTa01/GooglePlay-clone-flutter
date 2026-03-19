import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/entities/products/software_entity.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/action_row_ui_model.dart';

// UI‑payload для секции превью (layout=preview)
/// Содержит ровно те данные, которые требует [ProductPreviewSection]
final class ProductPreviewSectionUiModel {
  final List<String> productIds;
  final Map<String, List<String>> screenshotsByProductId;
  final Map<String, ActionRowUiModel> actionRowsByProductId;

  const ProductPreviewSectionUiModel({
    required this.productIds,
    required this.screenshotsByProductId,
    required this.actionRowsByProductId,
  });

  factory ProductPreviewSectionUiModel.fromProducts(
    List<ProductEntity> products,
  ) {
    final ids = <String>[];
    final screenshots = <String, List<String>>{};
    final actionRows = <String, ActionRowUiModel>{};

    for (final p in products) {
      ids.add(p.id);

      screenshots[p.id] =
          p is SoftwareEntity ? p.screenshots : const <String>[];

      actionRows[p.id] = ActionRowUiModel(
        id: p.id,
        title: p.title,
        creator: p.creator,
        ageLabel: '',
        tags: p.tags,
        thumbnailUrl: p.iconUrl,
        thumbnailBorderRadius: 8,
        thumbnailWidth: 40,
        thumbnailHeight: 40,
        thumbnailCacheWidth: 120,
        thumbnailCacheHeight: 120,
        thumbnailFit: BoxFit.cover,
        ratingText: p.rating.toStringAsFixed(1),
        technicalInfoText: p.technicalInfo,
        eventText: p is SoftwareEntity ? p.eventText : null,
        priceText: null,
        isPaid: p.isPaid,
        isBook: p.type == 'book',
        containsPaidContent: p is SoftwareEntity ? p.containsPaidContent : false,
        showThreeLines: true,
      );
    }

    return ProductPreviewSectionUiModel(
      productIds: ids,
      screenshotsByProductId: screenshots,
      actionRowsByProductId: actionRows,
    );
  }
}

