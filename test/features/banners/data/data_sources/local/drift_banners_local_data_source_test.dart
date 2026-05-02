import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/data/data_sources/local/drift_banners_local_data_source.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';

import '../../../../../test_utils/test_path_provider.dart';

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late DriftBannerLocalDataSource dataSource;

  setUp(() async {
    tempDir = await initTestDocumentsDirectory();
    db = AppDatabase();
    dataSource = DriftBannerLocalDataSource(db: db);
  });

  tearDown(() async {
    await db.close();
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('upsert/get/getById for event and action banners', () async {
    await dataSource.upsertBanners([
      BannerDto.event(
        id: 'e-1',
        imageAssetPath: '/event.png',
        title: const {'en': 'Event'},
        topToolTipText: const {'en': 'Top'},
        description: const {'en': 'Description'},
        eventId: 'event-1',
        eventCategory: 'sale',
        eventDescription: const {'en': 'Event details'},
        createdAt: DateTime.utc(2024, 1, 2),
        updatedAt: DateTime.utc(2024, 1, 2),
      ),
      BannerDto.action(
        id: 'a-1',
        productExternalId: 'product-1',
        imageAssetPath: '/action.png',
        title: const {'en': 'Action'},
        topToolTipText: null,
        description: const {'en': 'Description'},
        createdAt: DateTime.utc(2024, 1, 1),
        updatedAt: DateTime.utc(2024, 1, 1),
      ),
    ]);

    final events = await dataSource.getBanners(
      type: BannerKind.event,
      page: 1,
      pageSize: 20,
    );
    final actions = await dataSource.getBanners(
      type: BannerKind.action,
      page: 1,
      pageSize: 20,
    );
    final byId = await dataSource.getBannerById('a-1');

    expect(events, hasLength(1));
    expect(events.first.banner.id, 'e-1');
    expect(events.first.event, isNotNull);
    expect(actions, hasLength(1));
    expect(actions.first.banner.id, 'a-1');
    expect(actions.first.action, isNotNull);
    expect(byId, isNotNull);
    expect(byId?.action?.productExternalId, 'product-1');
  });

  test('watchBanners emits updated list after upsert', () async {
    final stream = dataSource.watchBanners(
      type: BannerKind.event,
      page: 1,
      pageSize: 20,
    );

    await dataSource.upsertBanners([
      BannerDto.event(
        id: 'e-2',
        imageAssetPath: '/event2.png',
        title: const {'en': 'Event 2'},
        topToolTipText: null,
        description: const {'en': 'Description'},
        eventId: null,
        eventCategory: null,
        eventDescription: null,
        createdAt: DateTime.utc(2024, 1, 3),
        updatedAt: DateTime.utc(2024, 1, 3),
      ),
    ]);

    await expectLater(
      stream,
      emits(
        predicate<List<dynamic>>(
          (items) => items.any((item) => item.banner.id == 'e-2'),
        ),
      ),
    );
  });
}
