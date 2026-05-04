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
  final executor = ref.watch(queryExecutorProvider);
  return SupabaseTabsNetworkDataSource(executor: executor);
}

// remote
@riverpod
SupabaseTabsRemoteDataSource tabsRemoteDataSource(Ref ref) {
  return SupabaseTabsRemoteDataSource(
    datasource: ref.watch(tabsNetworkDataSourceProvider),
  );
}

// local
@riverpod
DriftTabsLocalDataSource tabsLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftTabsLocalDataSource(db: db);
}

// repo
@riverpod
ITabsRepository tabsRepo(Ref ref) {
  final remote = ref.watch(tabsRemoteDataSourceProvider);
  final local = ref.watch(tabsLocalDataSourceProvider);
  final policy = ref.watch(freshnessPolicyProvider);
  return TabsRepository(remote: remote, local: local, policy: policy);
}

// usecase (keepAlive: иначе ref.read в FutureProvider снимает цепочку до await)
@Riverpod(keepAlive: true)
GetTabsUseCaseImpl getTabsUseCase(Ref ref) {
  final repo = ref.watch(tabsRepoProvider);
  return GetTabsUseCaseImpl(repo);
}
