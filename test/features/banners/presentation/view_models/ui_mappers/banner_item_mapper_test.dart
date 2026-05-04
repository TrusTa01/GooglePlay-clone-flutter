import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_mappers/banner_item_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/action_row_ui_model.dart';

void main() {
  const mapper = BannerItemMapper();

  test('maps ActionBannerEntity with product id and action row', () {
    final banner = ActionBannerEntity(
      id: 'a-1',
      type: BannerType.action,
      imageAssetPath: '/banner.png',
      title: 'Action',
      topTooltipText: 'Top',
      description: 'Desc',
      productExternalId: 'product-1',
    );
    const actionRow = ActionRowUiModel(
      id: 'p-1',
      title: 'Title',
      creator: 'Creator',
      ageLabel: '',
      tags: [],
      thumbnailUrl: '/thumb.png',
      thumbnailBorderRadius: 8,
      thumbnailWidth: 40,
      thumbnailHeight: 40,
      thumbnailCacheWidth: 120,
      thumbnailCacheHeight: 120,
      thumbnailFit: BoxFit.cover,
      ratingText: '4.5',
      technicalInfoText: '',
      isPaid: false,
      isBook: false,
      containsPaidContent: false,
      showThreeLines: false,
    );

    final ui = mapper.fromEntity(banner, actionRow: actionRow);

    expect(ui.id, 'a-1');
    expect(ui.imageAssetPath, '/banner.png');
    expect(ui.title, 'Action');
    expect(ui.topTooltipText, 'Top');
    expect(ui.description, 'Desc');
    expect(ui.productId, 'product-1');
    expect(ui.actionRow, actionRow);
  });

  test('maps EventBannerEntity and keeps productId null', () {
    final banner = EventBannerEntity(
      id: 'e-1',
      type: BannerType.event,
      imageAssetPath: '/event.png',
      title: null,
      topTooltipText: null,
      description: null,
      eventId: 'event-1',
      eventCategory: 'sale',
      eventDescription: 'Details',
    );

    final ui = mapper.fromEntity(banner);

    expect(ui.id, 'e-1');
    expect(ui.title, '');
    expect(ui.description, '');
    expect(ui.productId, isNull);
    expect(ui.actionRow, isNull);
  });
}
