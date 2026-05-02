import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_mappers/event_hero_banner_mapper.dart';

void main() {
  const mapper = EventHeroBannerMapper();

  test('maps event banner with tooltip', () {
    final entity = EventBannerEntity(
      id: 'e-1',
      type: BannerType.event,
      imageAssetPath: '/hero.png',
      title: 'Hero',
      topTooltipText: 'Hot',
      description: 'Desc',
      eventId: 'event-1',
      eventCategory: 'sale',
      eventDescription: 'Details',
    );

    final ui = mapper.fromEntity(entity);

    expect(ui.imageAssetPath, '/hero.png');
    expect(ui.title, 'Hero');
    expect(ui.hasTopTooltip, isTrue);
    expect(ui.topTooltipText, 'Hot');
  });

  test('maps null title to empty string and no tooltip flag', () {
    final entity = EventBannerEntity(
      id: 'e-2',
      type: BannerType.event,
      imageAssetPath: '/hero2.png',
      title: null,
      topTooltipText: null,
      description: 'Desc',
      eventId: null,
      eventCategory: null,
      eventDescription: null,
    );

    final ui = mapper.fromEntity(entity);

    expect(ui.title, '');
    expect(ui.hasTopTooltip, isFalse);
    expect(ui.topTooltipText, isNull);
  });
}
