import 'package:google_play/core/data/local/sync_keys.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/domain/freshness_policy/data_freshness.dart';
import 'package:google_play/core/domain/freshness_policy/freshness_policy.dart';
import 'package:google_play/core/domain/result_pattern/result.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/sections/data/data_sources/local/i_sections_local_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/i_sections_remote_data_source.dart';
import 'package:google_play/features/sections/data/models/network/tab_sections_dto.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/domain/repositories/i_sections_repository.dart';

class SectionsRepository implements ISectionsRepository {
  final ISectionsRemoteDataSource _remote;
  final ISectionsLocalDataSource _local;
  final FreshnessPolicy _policy;

  const SectionsRepository({
    required ISectionsRemoteDataSource remote,
    required ISectionsLocalDataSource local,
    required FreshnessPolicy policy,
  }) : _remote = remote,
       _local = local,
       _policy = policy;

  @override
  Future<List<SectionEntity>> getSections({
    required ProductKind productKind,
    required String tabId,
    required String locale,
    int page = 1,
    int pageSize = 200,
    bool forceRefresh = false,
  }) async {
    FeatureTalker.domain(
      'sections.repository',
      'get sections',
      context: {
        'productKind': productKind.name,
        'tabId': tabId,
        'page': page,
        'forceRefresh': forceRefresh,
      },
    );
    final syncKey = SyncKeys.sectionsList(
      storeTypeName: productKind.name,
      page: page,
      pageSize: pageSize,
    );
    final shouldSync = forceRefresh || await _needsSync(syncKey: syncKey);
    if (shouldSync) {
      await _refreshSections(
        productKind: productKind,
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
    required ProductKind productKind,
    int page = 1,
    int pageSize = 200,
  }) async {
    FeatureTalker.data(
      'sections.repository',
      'refresh sections from remote',
      context: {'productKind': productKind.name, 'page': page},
    );
    final result = await _remote.getSections(page: page, pageSize: pageSize);
    final syncKey = SyncKeys.sectionsList(
      storeTypeName: productKind.name,
      page: page,
      pageSize: pageSize,
    );
    switch (result) {
      case SuccessResult<List<SectionsDto>>(data: final dtos):
        FeatureTalker.data(
          'sections.repository',
          'sections refresh success',
          context: {'dtos': dtos},
        );
        await _local.upsertSections(dtos);
        await _local.setLastSync(syncKey, DateTime.now());
      case FailureResult<List<SectionsDto>>():
        FeatureTalker.data(
          'sections.repository',
          'sections refresh failed',
          context: {'productKind': productKind.name},
        );
        await _local.recordSyncFailure(syncKey);
    }
  }

  Future<bool> _needsSync({required String syncKey}) async {
    final freshness = await _freshnessForSyncKey(syncKey);
    return freshness.status.shouldFetch;
  }

  Future<DataFreshness> _freshnessForSyncKey(String syncKey) async {
    final t = await _local.getSyncTimestamps(syncKey);
    return DataFreshness.fromPersistedFields(
      policy: _policy,
      lastSuccessAt: t.lastSyncAt,
      lastFailureAt: t.lastFailureAt,
      failureCount: t.failureCount,
    );
  }

  @override
  Future<DataFreshness> getSectionsFreshness({
    required ProductKind productKind,
    required String tabKey,
  }) => _freshnessForSyncKey(
    SyncKeys.sectionsList(
      storeTypeName: productKind.name,
      page: 1,
      pageSize: 200,
    ),
  );
}
