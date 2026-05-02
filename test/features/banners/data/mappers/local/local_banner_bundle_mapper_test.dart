import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/data/mappers/local/local_banner_bundle_mapper.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';

void main() {
  test('maps event LocalBannerBundle to EventBannerEntity', () {
    final bundle = LocalBannerBundle(
      banner: CachedBanner(
        id: 'e-1',
        type: 'event',
        imageAssetPath: '/event.png',
        title: const {'en': 'Event', 'ru': 'Событие'},
        topTooltipText: const {'en': 'Top', 'ru': 'Верх'},
        description: const {'en': 'Desc', 'ru': 'Описание'},
        createdAt: DateTime.utc(2024, 1, 1),
        updatedAt: DateTime.utc(2024, 1, 2),
      ),
      event: const CachedEventBanner(
        bannerId: 'e-1',
        eventId: 'event-1',
        eventCategory: 'sale',
        eventDescription: {'en': 'Details', 'ru': 'Детали'},
      ),
    );

    final entity = bundle.toEntity('ru');

    expect(entity, isA<EventBannerEntity>());
    expect(entity?.type, BannerType.event);
    expect(entity?.title, 'Событие');
    expect((entity as EventBannerEntity).eventDescription, 'Детали');
  });

  test('maps action LocalBannerBundle to ActionBannerEntity', () {
    final bundle = LocalBannerBundle(
      banner: CachedBanner(
        id: 'a-1',
        type: 'action',
        imageAssetPath: '/action.png',
        title: const {'en': 'Action'},
        topTooltipText: const {'en': 'Top'},
        description: const {'en': 'Desc'},
        createdAt: DateTime.utc(2024, 1, 1),
        updatedAt: DateTime.utc(2024, 1, 2),
      ),
      action: const CachedActionBanner(
        bannerId: 'a-1',
        productExternalId: 'product-1',
      ),
    );

    final entity = bundle.toEntity('en');

    expect(entity, isA<ActionBannerEntity>());
    expect(entity?.type, BannerType.action);
    expect((entity as ActionBannerEntity).productExternalId, 'product-1');
  });

  test('returns null for unsupported banner type', () {
    final bundle = LocalBannerBundle(
      banner: CachedBanner(
        id: 'u-1',
        type: 'other',
        imageAssetPath: '/unknown.png',
        title: const {'en': 'Unknown'},
        topTooltipText: null,
        description: const {'en': 'Desc'},
        createdAt: DateTime.utc(2024, 1, 1),
        updatedAt: DateTime.utc(2024, 1, 2),
      ),
    );

    expect(bundle.toEntity('en'), isNull);
  });
}
