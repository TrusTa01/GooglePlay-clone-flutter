import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/data_sources/local/i_banners_local_data_source.dart';
import 'package:google_play/features/banners/data/data_sources/network/i_banners_remote_data_source.dart';
import 'package:google_play/features/banners/data/mappers/local/local_banner_bundle_mapper.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';

class CacheFirstBannersRepository implements IBannersRepository {
  final IBannersRemoteDataSource _remote;
  final IBannersLocalDataSource _local;
  final FreshnessPolicy _freshnessPolicy;
  final FetchBackoffPolicy _fetchBackoffPolicy;

  const CacheFirstBannersRepository({
    required IBannersRemoteDataSource remote,
    required IBannersLocalDataSource local,
    required FreshnessPolicy freshnessPolicy,
    required FetchBackoffPolicy fetchBackoffPolicy,
  }) : _remote = remote,
       _local = local,
       _freshnessPolicy = freshnessPolicy,
       _fetchBackoffPolicy = fetchBackoffPolicy;

  @override
  Future<List<BannerEntity>> getBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    final syncKey = SyncKeys.bannerListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    if (await _shouldAttemptRemoteRefresh(
      syncKey: syncKey,
      forceRefresh: forceRefresh,
    )) {
      await _refreshBanners(type: type, page: page, pageSize: pageSize);
    }
    final bundles = await _local.getBanners(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    return bundles.map((bundle) => bundle.toEntity(locale)).nonNulls.toList();
  }

  Future<bool> _shouldAttemptRemoteRefresh({
    required String syncKey,
    required bool forceRefresh,
  }) async {
    if (forceRefresh) return true;
    final freshness = await _freshnessForSyncKey(syncKey);
    if (!freshness.status.shouldFetch) return false;
    return !_fetchBackoffPolicy.shouldDeferFetch(freshness);
  }

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final t = await _local.getSyncTimestamps(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _freshnessPolicy,
      lastSuccessAt: t.lastSyncAt,
      lastFailureAt: t.lastFailureAt,
      failureCount: t.failureCount,
    );
  }

  Future<void> _refreshBanners({
    required String type,
    required int page,
    required int pageSize,
  }) async {
    final syncKey = SyncKeys.bannerListPage(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    final result = await _remote.getBanners(
      type: type,
      page: page,
      pageSize: pageSize,
    );

    switch (result) {
      case SuccessResult<List<BannerDto>>(data: final data):
        await _local.upsertBanners(data);
        await _local.setLastSync(syncKey, DateTime.now());
      case FailureResult():
        await _local.recordSyncFailure(syncKey);
    }
  }

  @override
  Stream<List<BannerEntity>> watchBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
  }) {
    return _local
        .watchBanners(type: type, page: page, pageSize: pageSize)
        .map(
          (bundles) => bundles
              .map((bundle) => bundle.toEntity(locale))
              .nonNulls
              .toList(growable: false),
        );
  }

  @override
  Future<BannerEntity?> getBannerById(
    String id, {
    required String type,
    required String locale,
    bool forceRefresh = false,
  }) async {
    final syncKey = SyncKeys.bannerItem(id);
    assert(
      type.isNotEmpty,
      'banner type is required for cache policy alignment',
    );
    if (await _shouldAttemptRemoteRefresh(
      syncKey: syncKey,
      forceRefresh: forceRefresh,
    )) {
      await _refreshBannerById(id);
    }

    final fromLocal = await _local.getBannerById(id);
    return fromLocal?.toEntity(locale);
  }

  Future<void> _refreshBannerById(String id) async {
    final syncKey = SyncKeys.bannerItem(id);
    final result = await _remote.getBannerById(id: id);

    switch (result) {
      case SuccessResult<BannerDto?>(data: final dto):
        if (dto != null) {
          await _local.upsertBanners([dto]);
          await _local.setLastSync(syncKey, DateTime.now());
        }
      case FailureResult():
        await _local.recordSyncFailure(syncKey);
    }
  }

  @override
  getBannersFreshness({required String type}) => _freshnessForSyncKey(
    SyncKeys.bannerListPage(type: type, page: 1, pageSize: 20),
  );

  @override
  getBannerFreshness(String id, String type) =>
      _freshnessForSyncKey(SyncKeys.bannerItem(id));
}
