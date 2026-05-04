import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/tabs/data/data_sources/local/drift_tabs_local_data_source.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';

import '../../../../../test_utils/test_path_provider.dart';

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late DriftTabsLocalDataSource dataSource;

  setUp(() async {
    tempDir = await initTestDocumentsDirectory();
    db = AppDatabase();
    dataSource = DriftTabsLocalDataSource(db: db);
  });

  tearDown(() async {
    await db.close();
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('upsertSections + getTabs returns localized and sorted tabs', () async {
    await dataSource.upsertSections([
      const TabsDto(
        id: 'tab-2',
        contentType: 'app',
        tabKey: 'latest',
        label: {'en': 'Latest', 'ru': 'Новое'},
        tabType: 'main',
        sortOrder: 2,
      ),
      const TabsDto(
        id: 'tab-1',
        contentType: 'app',
        tabKey: 'for_you',
        label: {'en': 'For you', 'ru': 'Для вас'},
        tabType: 'main',
        sortOrder: 1,
      ),
      const TabsDto(
        id: 'tab-book',
        contentType: 'book',
        tabKey: 'books',
        label: {'en': 'Books'},
        tabType: 'main',
        sortOrder: 1,
      ),
    ]);

    final tabs = await dataSource.getTabs(
      productKind: ProductKind.app,
      locale: 'ru',
      page: 1,
      pageSize: 20,
    );

    expect(tabs, hasLength(2));
    expect(tabs.first.id, 'tab-1');
    expect(tabs.first.label, 'Для вас');
    expect(tabs.last.id, 'tab-2');
    expect(tabs.last.label, 'Новое');
  });

  test(
    'sync state methods persist and return timestamps/cursor/failures',
    () async {
      const syncKey = 'tabs:app:page=1:size=100';
      final now = DateTime.now();

      await dataSource.setLastSync(syncKey, now);
      await dataSource.setSyncCursor(syncKey, 'cursor-1');
      await dataSource.recordSyncFailure(syncKey);
      await dataSource.recordSyncFailure(syncKey);

      final timestamps = await dataSource.getSyncTimestamps(syncKey);
      final cursor = await dataSource.getSyncCursor(syncKey);
      final lastSync = await dataSource.getLastSync(syncKey);

      expect(lastSync, isNotNull);
      expect(lastSync!.difference(now).inSeconds.abs(), lessThanOrEqualTo(1));
      expect(cursor, 'cursor-1');
      expect(timestamps.failureCount, 2);
      expect(timestamps.lastFailureAt, isNotNull);
    },
  );
}
