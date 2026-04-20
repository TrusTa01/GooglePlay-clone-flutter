import 'package:google_play/core/di/di.dart';
import 'package:google_play/features/tabs/data/data_sources/local/drift_tabs_local_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_network_data_source.dart';
import 'package:google_play/features/tabs/data/data_sources/network/supabase_tabs_remote_data_source.dart';
import 'package:google_play/features/tabs/data/repositories/tabs_repository.dart';
import 'package:google_play/features/tabs/domain/repositories/i_tabs_repository.dart';
import 'package:google_play/features/tabs/domain/use_cases/get_tabs_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

// network
@riverpod
SupabaseTabsNetworkDataSource tabsNetworkDataSource(Ref ref) {
  final executor = queryExecutor(ref);
  return SupabaseTabsNetworkDataSource(executor: executor);
}

// remote
@riverpod
SupabaseTabsRemoteDataSource tabsRemoteDataSource(Ref ref) {
  return SupabaseTabsRemoteDataSource(datasource: tabsNetworkDataSource(ref));
}

// local
@riverpod
DriftTabsLocalDataSource tabsLocalDataSource(Ref ref) {
  final db = appDatabase(ref);
  return DriftTabsLocalDataSource(db: db);
}

// repo
@riverpod
ITabsRepository tabsRepo(Ref ref) {
  final remote = tabsRemoteDataSource(ref);
  final local = tabsLocalDataSource(ref);
  final policy = freshnessPolicy(ref);
  return TabsRepository(remote: remote, local: local, policy: policy);
}

// usecase
@riverpod
GetTabsUseCaseImpl getTabsUseCase(Ref ref) {
  final repo = ref.watch(tabsRepoProvider);
  return GetTabsUseCaseImpl(repo);
}
