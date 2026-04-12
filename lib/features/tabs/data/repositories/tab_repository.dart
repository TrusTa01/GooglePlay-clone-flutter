import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/tabs/data/datasources/local/drift_tabs_local_datasource.dart';
import 'package:google_play/features/tabs/data/datasources/network/supabase_tab_remote_datasource.dart';
import 'package:google_play/features/tabs/data/models/tabs_dto.dart';
import 'package:google_play/features/tabs/domain/entities/tab_entity.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tab_repository.dart';

class TabRepository implements ITabRepository {
  final SupabaseTabsRemoteDatasource _remote;
  final DriftTabsLocalDatasource _local;
  final FreshnessPolicy _policy;

  const TabRepository({
    required SupabaseTabsRemoteDatasource remote,
    required DriftTabsLocalDatasource local,
    required FreshnessPolicy policy,
  }) : _remote = remote,
       _local = local,
       _policy = policy;

  @override
  Future<List<TabsEntity>> getTabs({
    required String id,
    required StoreType storeType,
    required String locale,
    int page = 1,
    int pageSize = 100,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh ||
        await _needsSync(
          syncKey: SyncKeys.tabsList(
            storeTypeName: storeType.name,
            page: page,
            pageSize: pageSize,
          ),
        )) {
      await _refreshTabs(storeType: storeType, page: page, pageSize: pageSize);
    }

    final tabs = await _local.getTabs(
      id: id,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );

    return tabs;
  }

  Future<void> _refreshTabs({
    required StoreType storeType,
    required int page,
    required int pageSize,
  }) async {
    final result = await _remote.getTabs(page: page, pageSize: pageSize);
    if (result case SuccessResult<List<TabsDto>>(data: final dtos)) {
      await _local.upsertSections(dtos);
      await _local.setLastSync(
        SyncKeys.tabsList(
          storeTypeName: storeType.name,
          page: page,
          pageSize: pageSize,
        ),
        DateTime.now(),
      );
    }
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  @override
  Future<DataFreshness> getTabsFreshness({required StoreType storeType}) =>
      _freshnessForSyncKey(
        SyncKeys.tabsList(
          storeTypeName: storeType.name,
          page: 1,
          pageSize: 100,
        ),
      );

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final lastSync = await _local.getLastSync(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _policy,
      lastSuccessAt: lastSync,
    );
  }
}
