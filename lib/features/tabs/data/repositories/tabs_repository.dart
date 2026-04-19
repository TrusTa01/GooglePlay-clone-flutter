import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/data_sources/local/drift_tabs_local_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_remote_data_source.dart';
import 'package:google_play/features/tabs/data/models/network/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';

class TabsRepository implements ITabsRepository {
  final SupabaseTabsRemoteDataSource _remote;
  final DriftTabsLocalDataSource _local;
  final FreshnessPolicy _policy;

  const TabsRepository({
    required SupabaseTabsRemoteDataSource remote,
    required DriftTabsLocalDataSource local,
    required FreshnessPolicy policy,
  }) : _remote = remote,
       _local = local,
       _policy = policy;

  @override
  Future<List<TabsEntity>> getTabs({
    required ProductKind productKind,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh ||
        await _needsSync(
          syncKey: SyncKeys.tabsList(
            storeTypeName: productKind.name,
            page: page,
            pageSize: pageSize,
          ),
        )) {
      await _refreshTabs(
        productKind: productKind,
        page: page,
        pageSize: pageSize,
      );
    }

    final tabs = await _local.getTabs(
      productKind: productKind,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );

    return tabs;
  }

  Future<void> _refreshTabs({
    required ProductKind productKind,
    required int page,
    required int pageSize,
  }) async {
    final result = await _remote.getTabs(page: page, pageSize: pageSize);
    final syncKey = SyncKeys.tabsList(
      storeTypeName: productKind.name,
      page: page,
      pageSize: pageSize,
    );

    switch (result) {
      case SuccessResult<List<TabsDto>>(data: final dtos):
        await _local.upsertSections(dtos);
        await _local.setLastSync(syncKey, DateTime.now());
      case FailureResult():
        await _local.recordSyncFailure(syncKey);
    }
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  @override
  Future<DataFreshness> getTabsFreshness({required ProductKind productKind}) =>
      _freshnessForSyncKey(
        SyncKeys.tabsList(
          storeTypeName: productKind.name,
          page: 1,
          pageSize: 100,
        ),
      );

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final t = await _local.getSyncTimestamps(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _policy,
      lastSuccessAt: t.lastSyncAt,
      lastFailureAt: t.lastFailureAt,
      failureCount: t.failureCount,
    );
  }
}
