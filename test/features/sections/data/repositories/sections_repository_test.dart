import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/data_sources/local/i_sections_local_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/i_sections_remote_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/data/repositories/sections_repository.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockSectionsRemoteDataSource extends Mock
    implements ISectionsRemoteDataSource {}

class MockSectionsLocalDataSource extends Mock
    implements ISectionsLocalDataSource {}

class MockFreshnessPolicy extends Mock implements FreshnessPolicy {}

void main() {
  late MockSectionsRemoteDataSource remote;
  late MockSectionsLocalDataSource local;
  late MockFreshnessPolicy policy;
  late SectionsRepository repository;

  setUpAll(() {
    registerFallbackValue(DataFreshness(status: FreshnessStatus.missing));
  });

  setUp(() {
    remote = MockSectionsRemoteDataSource();
    local = MockSectionsLocalDataSource();
    policy = MockFreshnessPolicy();
    repository = SectionsRepository(
      remote: remote,
      local: local,
      policy: policy,
    );
  });

  group('SectionsRepository.getSections', () {
    test('uses only local cache when freshness is fresh', () async {
      final syncKey = SyncKeys.sectionsList(
        storeTypeName: ProductKind.app.name,
        page: 1,
        pageSize: 200,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async =>
            (lastSyncAt: DateTime.now(), lastFailureAt: null, failureCount: 0),
      );
      when(
        () => policy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.fresh);
      when(
        () => local.getSections(
          tabId: 'for_you',
          locale: 'en',
          page: 1,
          pageSize: 200,
        ),
      ).thenAnswer((_) async => [_sectionEntity(id: 'local-1')]);

      final result = await repository.getSections(
        productKind: ProductKind.app,
        tabId: 'for_you',
        locale: 'en',
      );

      expect(result.single.id, 'local-1');
      verifyNever(() => remote.getSections(page: 1, pageSize: 200));
    });

    test('refreshes stale data and persists successful response', () async {
      final syncKey = SyncKeys.sectionsList(
        storeTypeName: ProductKind.book.name,
        page: 1,
        pageSize: 200,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async => (
          lastSyncAt: DateTime.now().subtract(const Duration(days: 3)),
          lastFailureAt: null,
          failureCount: 0,
        ),
      );
      when(
        () => policy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.stale);
      when(() => remote.getSections(page: 1, pageSize: 200)).thenAnswer(
        (_) async => Result.success(data: [_sectionDto(id: 'remote-1')]),
      );
      when(() => local.upsertSections(any())).thenAnswer((_) async {});
      when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
      when(
        () => local.getSections(
          tabId: 'books',
          locale: 'ru',
          page: 1,
          pageSize: 200,
        ),
      ).thenAnswer((_) async => [_sectionEntity(id: 'remote-1')]);

      final result = await repository.getSections(
        productKind: ProductKind.book,
        tabId: 'books',
        locale: 'ru',
      );

      expect(result.single.id, 'remote-1');
      verify(() => remote.getSections(page: 1, pageSize: 200)).called(1);
      verify(() => local.upsertSections(any())).called(1);
      verify(() => local.setLastSync(syncKey, any())).called(1);
    });

    test('records sync failure when remote refresh fails', () async {
      final syncKey = SyncKeys.sectionsList(
        storeTypeName: ProductKind.game.name,
        page: 1,
        pageSize: 200,
      );
      when(() => remote.getSections(page: 1, pageSize: 200)).thenAnswer(
        (_) async =>
            const Result.failure(failure: Failure.server(message: '500')),
      );
      when(() => local.recordSyncFailure(syncKey)).thenAnswer((_) async {});
      when(
        () => local.getSections(
          tabId: 'games',
          locale: 'en',
          page: 1,
          pageSize: 200,
        ),
      ).thenAnswer((_) async => [_sectionEntity(id: 'fallback-1')]);

      final result = await repository.getSections(
        productKind: ProductKind.game,
        tabId: 'games',
        locale: 'en',
        forceRefresh: true,
      );

      expect(result.single.id, 'fallback-1');
      verify(() => local.recordSyncFailure(syncKey)).called(1);
    });
  });
}

SectionsDto _sectionDto({required String id}) => SectionsDto(
  id: id,
  tabId: 'for_you',
  tabKey: 'for_you',
  sectionType: 'grid',
  title: const {'en': 'Section'},
  subtitle: const {'en': 'Subtitle'},
  dataSource: 'products',
  imageAssetPath: 'asset.png',
  sortOrder: 1,
  contentType: 'apps',
  dataParamsDto: null,
);

SectionEntity _sectionEntity({required String id}) => SectionEntity(
  id: id,
  tabKey: 'for_you',
  sectionType: SectionLayoutKind.grid,
  sortOrder: 1,
  contentType: 'apps',
  dataSource: const ProductListSource(),
);
