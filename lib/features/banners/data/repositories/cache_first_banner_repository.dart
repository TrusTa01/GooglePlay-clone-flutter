import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/banners/data/datasources/local/i_banner_local_datasource.dart';
import 'package:google_play/features/banners/data/datasources/network/i_banner_remote_data_source.dart';
import 'package:google_play/features/banners/data/mappers/local/local_banner_bundle_mapper.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banner_repository.dart';

class CacheFirstBannerRepository implements IBannerRepository {
  final IBannerRemoteDataSource _remote;
  final IBannerLocalDatasource _local;
  final FreshnessPolicy _freshnessPolicy;

  const CacheFirstBannerRepository({
    required IBannerRemoteDataSource remote,
    required IBannerLocalDatasource local,
    required FreshnessPolicy freshnessPolicy,
  }) : _remote = remote,
       _local = local,
       _freshnessPolicy = freshnessPolicy;

  @override
  Future<List<BannerEntity>> getBanners({
    required String type,
    required String locale,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh || await _needsSync(syncKey: _syncListKey(type))) {
      await _refreshBanners(type: type, page: page, pageSize: pageSize);
    }
    final bundles = await _local.getBanners(
      type: type,
      page: page,
      pageSize: pageSize,
    );
    return bundles.map((bundle) => bundle.toEntity(locale)).nonNulls.toList();
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final lastSync = await _local.getLastSync(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _freshnessPolicy,
      lastSuccessAt: lastSync,
    );
  }

  Future<void> _refreshBanners({
    required String type,
    required int page,
    required int pageSize,
  }) async {
    final result = await _remote.getBanners(
      type: type,
      page: page,
      pageSize: pageSize,
    );

    if (result case SuccessResult(data: final dtos)) {
      await _local.upsertBanners(dtos);
      await _local.setLastSync(_syncListKey(type), DateTime.now());
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
    required String locale,
    bool forceRefresh = false,
  }) async {
    final syncKey = _syncItemKey(id);
    if (forceRefresh || await _needsSync(syncKey: syncKey)) {
      await _refreshBannerById(id);
    }

    final fromLocal = await _local.getBannerById(id);
    return fromLocal?.toEntity(locale);
  }

  Future<void> _refreshBannerById(String id) async {
    final result = await _remote.getBannerById(id: id);
    if (result case SuccessResult<BannerDto>(data: final dto)) {
      await _local.upsertBanners([dto]);
      await _local.setLastSync(_syncItemKey(id), DateTime.now());
    }
  }

  @override
  getBannersFreshness({required String type}) =>
      _freshnessForSyncKey(_syncListKey(type));

  @override
  getBannerFreshness(String id, String type) =>
      _freshnessForSyncKey(_syncItemKey(id));

  String _syncListKey(String type) => 'banners:$type';
  String _syncItemKey(String id) => 'banner:$id';
}
