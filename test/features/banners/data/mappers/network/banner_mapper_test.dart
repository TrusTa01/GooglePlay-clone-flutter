import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/banners/data/mappers/network/banner_mapper.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';

void main() {
  test('maps ActionBannerDto to ActionBannerEntity with localized fields', () {
    final dto = BannerDto.action(
      id: 'a-1',
      productExternalId: 'product-1',
      imageAssetPath: '/action.png',
      title: const {'en': 'Action', 'ru': 'Акция'},
      topToolTipText: const {'en': 'Top', 'ru': 'Верх'},
      description: const {'en': 'Desc', 'ru': 'Описание'},
      createdAt: DateTime.utc(2024, 1, 1),
      updatedAt: DateTime.utc(2024, 1, 2),
    );

    final entity = dto.toEntity('ru');

    expect(entity, isA<ActionBannerEntity>());
    expect(entity.id, 'a-1');
    expect(entity.type, BannerType.action);
    expect(entity.title, 'Акция');
    expect(entity.topTooltipText, 'Верх');
    expect(entity.description, 'Описание');
    expect((entity as ActionBannerEntity).productExternalId, 'product-1');
  });

  test('maps EventBannerDto to EventBannerEntity with fallback locale', () {
    final dto = BannerDto.event(
      id: 'e-1',
      imageAssetPath: '/event.png',
      title: const {'en': 'Event'},
      topToolTipText: null,
      description: const {'en': 'Event desc'},
      eventId: 'event-1',
      eventCategory: 'sale',
      eventDescription: const {'en': 'Event details'},
      createdAt: DateTime.utc(2024, 1, 1),
      updatedAt: DateTime.utc(2024, 1, 2),
    );

    final entity = dto.toEntity('ru');

    expect(entity, isA<EventBannerEntity>());
    expect(entity.type, BannerType.event);
    expect(entity.title, 'Event');
    expect(entity.description, 'Event desc');
    expect((entity as EventBannerEntity).eventDescription, 'Event details');
    expect(entity.topTooltipText, isNull);
  });
}
