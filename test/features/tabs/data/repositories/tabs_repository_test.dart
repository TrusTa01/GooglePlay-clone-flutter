import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/data_sources/local/drift_tabs_local_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_remote_data_source.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:google_play/features/tabs/data/repositories/tabs_repository.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockTabsRemoteDataSource extends Mock
    implements SupabaseTabsRemoteDataSource {}

class MockTabsLocalDataSource extends Mock
    implements DriftTabsLocalDataSource {}

class MockFreshnessPolicy extends Mock implements FreshnessPolicy {}

void main() {
  late MockTabsRemoteDataSource remote;
  late MockTabsLocalDataSource local;
  late MockFreshnessPolicy policy;
  late TabsRepository repository;

  setUpAll(() {
    registerFallbackValue(DataFreshness(status: FreshnessStatus.missing));
  });

  setUp(() {
    remote = MockTabsRemoteDataSource();
    local = MockTabsLocalDataSource();
    policy = MockFreshnessPolicy();
    repository = TabsRepository(remote: remote, local: local, policy: policy);
  });

  group('TabsRepository.getTabs', () {
    test(
      'returns local cache without refresh when freshness is fresh',
      () async {
        final syncKey = SyncKeys.tabsList(
          storeTypeName: ProductKind.app.name,
          page: 1,
          pageSize: 100,
        );
        when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
          (_) async => (
            lastSyncAt: DateTime.now(),
            lastFailureAt: null,
            failureCount: 0,
          ),
        );
        when(
          () => policy.getStatus(any(), now: any(named: 'now')),
        ).thenReturn(FreshnessStatus.fresh);
        when(
          () => local.getTabs(
            productKind: ProductKind.app,
            locale: 'en',
            page: 1,
            pageSize: 100,
          ),
        ).thenAnswer((_) async => [_tabEntity(id: 'tab-local')]);

        final result = await repository.getTabs(
          productKind: ProductKind.app,
          locale: 'en',
        );

        expect(result.single.id, 'tab-local');
        verifyNever(() => remote.getTabs(page: 1, pageSize: 100));
      },
    );

    test('refreshes and persists when cache is stale', () async {
      final syncKey = SyncKeys.tabsList(
        storeTypeName: ProductKind.game.name,
        page: 1,
        pageSize: 100,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async => (
          lastSyncAt: DateTime.now().subtract(const Duration(days: 2)),
          lastFailureAt: null,
          failureCount: 0,
        ),
      );
      when(
        () => policy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.stale);
      when(() => remote.getTabs(page: 1, pageSize: 100)).thenAnswer(
        (_) async => Result.success(data: [_tabDto(id: 'tab-remote')]),
      );
      when(() => local.upsertSections(any())).thenAnswer((_) async {});
      when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
      when(
        () => local.getTabs(
          productKind: ProductKind.game,
          locale: 'en',
          page: 1,
          pageSize: 100,
        ),
      ).thenAnswer((_) async => [_tabEntity(id: 'tab-remote')]);

      final result = await repository.getTabs(
        productKind: ProductKind.game,
        locale: 'en',
      );

      expect(result.single.id, 'tab-remote');
      verify(() => remote.getTabs(page: 1, pageSize: 100)).called(1);
      verify(() => local.upsertSections(any())).called(1);
      verify(() => local.setLastSync(syncKey, any())).called(1);
    });

    test('records sync failure when remote refresh fails', () async {
      final syncKey = SyncKeys.tabsList(
        storeTypeName: ProductKind.book.name,
        page: 1,
        pageSize: 100,
      );
      when(() => remote.getTabs(page: 1, pageSize: 100)).thenAnswer(
        (_) async =>
            const Result.failure(failure: Failure.server(message: '500')),
      );
      when(() => local.recordSyncFailure(syncKey)).thenAnswer((_) async {});
      when(
        () => local.getTabs(
          productKind: ProductKind.book,
          locale: 'en',
          page: 1,
          pageSize: 100,
        ),
      ).thenAnswer((_) async => [_tabEntity(id: 'tab-fallback')]);

      final result = await repository.getTabs(
        productKind: ProductKind.book,
        locale: 'en',
        forceRefresh: true,
      );

      expect(result.single.id, 'tab-fallback');
      verify(() => local.recordSyncFailure(syncKey)).called(1);
    });
  });

  test(
    'getTabsFreshness returns freshness computed from sync timestamps',
    () async {
      final syncKey = SyncKeys.tabsList(
        storeTypeName: ProductKind.app.name,
        page: 1,
        pageSize: 100,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async => (
          lastSyncAt: DateTime.now().subtract(const Duration(hours: 6)),
          lastFailureAt: null,
          failureCount: 0,
        ),
      );
      when(
        () => policy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.stale);

      final result = await repository.getTabsFreshness(
        productKind: ProductKind.app,
      );

      expect(result.status, FreshnessStatus.stale);
    },
  );
}

TabsDto _tabDto({required String id}) => TabsDto(
  id: id,
  contentType: 'apps',
  tabKey: 'for_you',
  label: const {'en': 'For you'},
  tabType: 'main',
  sortOrder: 1,
);

TabsEntity _tabEntity({required String id}) => TabsEntity(
  id: id,
  contentType: 'apps',
  tabKey: 'for_you',
  label: 'For you',
  tabType: 'main',
  sortOrder: 1,
);
