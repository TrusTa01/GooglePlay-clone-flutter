import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_status_enum.dart';
import 'package:google_play/core/domain/result_pattern/failure.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/banners/data/data_sources/local/i_banners_local_data_source.dart';
import 'package:google_play/features/banners/data/data_sources/network/i_banners_remote_data_source.dart';
import 'package:google_play/features/banners/data/models/local/local_banner_bundle.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/data/repositories/cache_first_banners_repository.dart';
import 'package:google_play/features/banners/domain/entities/action_banner_entity.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockBannersRemoteDataSource extends Mock
    implements IBannersRemoteDataSource {}

class MockBannersLocalDataSource extends Mock
    implements IBannersLocalDataSource {}

class MockFreshnessPolicy extends Mock implements FreshnessPolicy {}

class MockFetchBackoffPolicy extends Mock implements FetchBackoffPolicy {}

void main() {
  late MockBannersRemoteDataSource remote;
  late MockBannersLocalDataSource local;
  late MockFreshnessPolicy freshnessPolicy;
  late MockFetchBackoffPolicy backoffPolicy;
  late CacheFirstBannersRepository repository;

  setUpAll(() {
    registerFallbackValue(DataFreshness(status: FreshnessStatus.missing));
  });

  setUp(() {
    remote = MockBannersRemoteDataSource();
    local = MockBannersLocalDataSource();
    freshnessPolicy = MockFreshnessPolicy();
    backoffPolicy = MockFetchBackoffPolicy();
    repository = CacheFirstBannersRepository(
      remote: remote,
      local: local,
      freshnessPolicy: freshnessPolicy,
      fetchBackoffPolicy: backoffPolicy,
    );
  });

  group('getBanners', () {
    test('returns mapped local banners when cache is fresh', () async {
      final syncKey = SyncKeys.bannerListPage(
        type: BannerKind.event,
        page: 1,
        pageSize: 20,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async =>
            (lastSyncAt: DateTime.now(), lastFailureAt: null, failureCount: 0),
      );
      when(
        () => freshnessPolicy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.fresh);
      when(
        () => local.getBanners(type: BannerKind.event, page: 1, pageSize: 20),
      ).thenAnswer((_) async => [_eventBundle(id: 'event-1')]);

      final result = await repository.getBanners(
        type: BannerKind.event,
        locale: 'en',
      );

      expect(result, hasLength(1));
      expect(result.first, isA<EventBannerEntity>());
      expect(result.first.id, 'event-1');
      verifyNever(
        () => remote.getBanners(type: BannerKind.event, page: 1, pageSize: 20),
      );
    });

    test('refreshes stale cache and persists successful response', () async {
      final syncKey = SyncKeys.bannerListPage(
        type: BannerKind.action,
        page: 1,
        pageSize: 20,
      );
      when(() => local.getSyncTimestamps(syncKey)).thenAnswer(
        (_) async => (
          lastSyncAt: DateTime.now().subtract(const Duration(days: 2)),
          lastFailureAt: null,
          failureCount: 0,
        ),
      );
      when(
        () => freshnessPolicy.getStatus(any(), now: any(named: 'now')),
      ).thenReturn(FreshnessStatus.stale);
      when(
        () => backoffPolicy.shouldDeferFetch(any(), now: any(named: 'now')),
      ).thenReturn(false);
      when(
        () => remote.getBanners(type: BannerKind.action, page: 1, pageSize: 20),
      ).thenAnswer(
        (_) async => Result.success(data: [_actionDto(id: 'action-1')]),
      );
      when(() => local.upsertBanners(any())).thenAnswer((_) async {});
      when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
      when(
        () => local.getBanners(type: BannerKind.action, page: 1, pageSize: 20),
      ).thenAnswer((_) async => [_actionBundle(id: 'action-1')]);

      final result = await repository.getBanners(
        type: BannerKind.action,
        locale: 'en',
      );

      expect(result, hasLength(1));
      expect(result.first, isA<ActionBannerEntity>());
      verify(
        () => remote.getBanners(type: BannerKind.action, page: 1, pageSize: 20),
      ).called(1);
      verify(() => local.upsertBanners(any())).called(1);
      verify(() => local.setLastSync(syncKey, any())).called(1);
    });

    test('records sync failure when remote refresh fails', () async {
      final syncKey = SyncKeys.bannerListPage(
        type: BannerKind.event,
        page: 1,
        pageSize: 20,
      );
      when(
        () => remote.getBanners(type: BannerKind.event, page: 1, pageSize: 20),
      ).thenAnswer(
        (_) async =>
            const Result.failure(failure: Failure.server(message: '500')),
      );
      when(() => local.recordSyncFailure(syncKey)).thenAnswer((_) async {});
      when(
        () => local.getBanners(type: BannerKind.event, page: 1, pageSize: 20),
      ).thenAnswer((_) async => [_eventBundle(id: 'event-local')]);

      final result = await repository.getBanners(
        type: BannerKind.event,
        locale: 'en',
        forceRefresh: true,
      );

      expect(result.single.id, 'event-local');
      verify(() => local.recordSyncFailure(syncKey)).called(1);
      verifyNever(() => local.upsertBanners(any()));
    });
  });

  group('getBannerById / watchBanners', () {
    test('forceRefresh fetches by id and updates local cache', () async {
      const id = 'action-id-1';
      final syncKey = SyncKeys.bannerItem(id);
      when(
        () => remote.getBannerById(id: id),
      ).thenAnswer((_) async => Result.success(data: _actionDto(id: id)));
      when(() => local.upsertBanners(any())).thenAnswer((_) async {});
      when(() => local.setLastSync(any(), any())).thenAnswer((_) async {});
      when(
        () => local.getBannerById(id),
      ).thenAnswer((_) async => _actionBundle(id: id));

      final result = await repository.getBannerById(
        id,
        type: BannerKind.action,
        locale: 'en',
        forceRefresh: true,
      );

      expect(result, isA<ActionBannerEntity>());
      expect(result?.id, id);
      verify(() => local.upsertBanners(any())).called(1);
      verify(() => local.setLastSync(syncKey, any())).called(1);
    });

    test('watchBanners maps local stream entities', () async {
      when(
        () => local.watchBanners(type: BannerKind.event, page: 1, pageSize: 20),
      ).thenAnswer((_) => Stream.value([_eventBundle(id: 'stream-1')]));

      final stream = repository.watchBanners(
        type: BannerKind.event,
        locale: 'en',
      );

      await expectLater(
        stream,
        emits(
          predicate<List<dynamic>>(
            (items) =>
                items.length == 1 &&
                items.first is EventBannerEntity &&
                items.first.id == 'stream-1',
          ),
        ),
      );
    });
  });
}

BannerDto _actionDto({required String id}) => BannerDto.action(
  id: id,
  productExternalId: 'product-$id',
  imageAssetPath: '/$id.png',
  title: const {'en': 'Action'},
  topToolTipText: const {'en': 'Top'},
  description: const {'en': 'Description'},
  createdAt: DateTime.utc(2024, 1, 1),
  updatedAt: DateTime.utc(2024, 1, 2),
);

LocalBannerBundle _actionBundle({required String id}) => LocalBannerBundle(
  banner: CachedBanner(
    id: id,
    type: 'action',
    imageAssetPath: '/$id.png',
    title: const {'en': 'Action'},
    topTooltipText: const {'en': 'Top'},
    description: const {'en': 'Description'},
    createdAt: DateTime.utc(2024, 1, 1),
    updatedAt: DateTime.utc(2024, 1, 2),
  ),
  action: CachedActionBanner(bannerId: id, productExternalId: 'product-$id'),
);

LocalBannerBundle _eventBundle({required String id}) => LocalBannerBundle(
  banner: CachedBanner(
    id: id,
    type: 'event',
    imageAssetPath: '/$id.png',
    title: const {'en': 'Event'},
    topTooltipText: const {'en': 'Top'},
    description: const {'en': 'Description'},
    createdAt: DateTime.utc(2024, 1, 1),
    updatedAt: DateTime.utc(2024, 1, 2),
  ),
  event: CachedEventBanner(
    bannerId: id,
    eventId: 'evt-$id',
    eventCategory: 'sale',
    eventDescription: const {'en': 'Event description'},
  ),
);
