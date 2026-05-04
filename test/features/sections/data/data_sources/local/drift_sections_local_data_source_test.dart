import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/sections/data/data_sources/local/drift_sections_local_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';

import '../../../../../test_utils/test_path_provider.dart';

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late DriftSectionsLocalDataSource dataSource;

  setUp(() async {
    tempDir = await initTestDocumentsDirectory();
    db = AppDatabase();
    dataSource = DriftSectionsLocalDataSource(db: db);
  });

  tearDown(() async {
    await db.close();
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test(
    'upsertSections + getSections returns mapped and sorted sections',
    () async {
      await dataSource.upsertSections([
        const SectionsDto(
          id: 's-2',
          tabId: 'for_you',
          tabKey: 'for_you',
          sectionType: 'carousel',
          title: {'en': 'Top picks', 'ru': 'Топ'},
          subtitle: {'en': 'Popular'},
          dataSource: 'products_list',
          imageAssetPath: '/carousel.png',
          sortOrder: 2,
          contentType: 'app',
          dataParamsDto: ParamsDto(
            sort: 'top_rated',
            extras: ParamsExtrasDto(
              filters: [ParamFilterDto(type: 'category', value: 'Action')],
            ),
          ),
        ),
        const SectionsDto(
          id: 's-1',
          tabId: 'for_you',
          tabKey: 'for_you',
          sectionType: 'banners',
          title: {'en': 'Banners'},
          subtitle: null,
          dataSource: 'banners',
          imageAssetPath: '/banners.png',
          sortOrder: 1,
          contentType: 'banners',
          dataParamsDto: null,
        ),
        const SectionsDto(
          id: 's-other-tab',
          tabId: 'games',
          tabKey: 'games',
          sectionType: 'grid',
          title: {'en': 'Games'},
          subtitle: null,
          dataSource: 'products_list',
          imageAssetPath: '/games.png',
          sortOrder: 1,
          contentType: 'game',
          dataParamsDto: null,
        ),
      ]);

      final sections = await dataSource.getSections(
        tabId: 'for_you',
        locale: 'ru',
        page: 1,
        pageSize: 20,
      );

      expect(sections, hasLength(2));
      expect(sections.first.id, 's-1');
      expect(sections.first.sectionType, SectionLayoutKind.banners);
      expect(sections.first.dataSource, isA<BannersSource>());
      expect(sections.last.id, 's-2');
      expect(sections.last.sectionType, SectionLayoutKind.carousel);
      expect(sections.last.title, 'Топ');
      expect(sections.last.dataParamsEntity?.sort, 'top_rated');
    },
  );

  test(
    'getSections matches tab_id UUID or tab_key when columns differ',
    () async {
      const uuid = '5d3ce9f3-0e25-4a9a-bc6a-49a1147be8a4';
      await dataSource.upsertSections([
        SectionsDto(
          id: 's-by-tab',
          tabId: uuid,
          tabKey: 'recommended',
          sectionType: 'carousel',
          title: const {'en': 'Row'},
          subtitle: null,
          dataSource: 'products_list',
          imageAssetPath: '/x.png',
          sortOrder: 1,
          contentType: 'game',
          dataParamsDto: null,
        ),
      ]);

      final byKey = await dataSource.getSections(
        tabId: 'recommended',
        locale: 'en',
        page: 1,
        pageSize: 20,
      );
      final byUuid = await dataSource.getSections(
        tabId: uuid,
        locale: 'en',
        page: 1,
        pageSize: 20,
      );

      expect(byKey, hasLength(1));
      expect(byUuid, hasLength(1));
      expect(byKey.single.id, 's-by-tab');
    },
  );

  test('sync state methods persist and restore values', () async {
    const syncKey = 'sections:app:page=1:size=200';
    final now = DateTime.now();

    await dataSource.setLastSync(syncKey, now);
    await dataSource.setSyncCursor(syncKey, 'sec-cursor');
    await dataSource.recordSyncFailure(syncKey);

    final timestamps = await dataSource.getSyncTimestamps(syncKey);
    final cursor = await dataSource.getSyncCursor(syncKey);

    expect(timestamps.lastSyncAt, isNotNull);
    expect(timestamps.failureCount, 1);
    expect(timestamps.lastFailureAt, isNotNull);
    expect(cursor, 'sec-cursor');
  });
}
