import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/features/sections/data/datasources/local/i_sections_local_datasource.dart';
import 'package:google_play/features/sections/data/datasources/network/i_section_remote_datasource.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/section_entity.dart';
import 'package:google_play/features/sections/domain/repositories/i_section_repository.dart';

class SectionRepository implements ISectionRepository {
  final ISectionRemoteDataSource _remote;
  final ISectionsLocalDatasource _local;
  final FreshnessPolicy _policy;

  const SectionRepository({
    required ISectionRemoteDataSource remote,
    required ISectionsLocalDatasource local,
    required FreshnessPolicy policy,
  }) : _remote = remote,
       _local = local,
       _policy = policy;

  @override
  Future<List<SectionEntity>> getSections({
    required StoreType storeType,
    required String tabId,
    required String locale,
    int page = 1,
    int pageSize = 200,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh ||
        await _needsSync(syncKey: _syncListKey(storeType.name))) {
      await _refreshSections(
        storeType: storeType,
        page: page,
        pageSize: pageSize,
      );
    }
    return await _local.getSections(
      tabId: tabId,
      locale: locale,
      page: page,
      pageSize: pageSize,
    );
  }

  Future<void> _refreshSections({
    required StoreType storeType,
    int page = 1,
    int pageSize = 200,
  }) async {
    final result = await _remote.getSections(page: page, pageSize: pageSize);
    if (result case SuccessResult<List<SectionsDto>>(data: final dtos)) {
      await _local.upsertSections(dtos);
      await _local.setLastSync(_syncListKey(storeType.name), DateTime.now());
    }
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final lastSync = await _local.getLastSync(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _policy,
      lastSuccessAt: lastSync,
    );
  }

  @override
  Future<DataFreshness> getSectionsFreshness({
    required StoreType storeType,
    required String tabKey,
  }) => _freshnessForSyncKey(_syncListKey(storeType.name));

  String _syncListKey(String type) => 'sections:$type';
}
