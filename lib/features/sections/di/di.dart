import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_play/core/di/di.dart';
import 'package:google_play/features/sections/data/data_sources/local/drift_sections_local_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_network_data_source.dart';
import 'package:google_play/features/sections/data/data_sources/network/supabase_sections_remote_data_source.dart';
import 'package:google_play/features/sections/data/repositories/sections_repository.dart';
import 'package:google_play/features/sections/domain/repositories/i_sections_repository.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_freshness_use_case.dart';
import 'package:google_play/features/sections/domain/use_cases/get_sections_use_case.dart';

part 'di.g.dart';

// network
@riverpod
SupabaseSectionsNetworkDataSource sectionsNetworkDatasource(Ref ref) {
  final executor = queryExecutor(ref);
  return SupabaseSectionsNetworkDataSource(executor: executor);
}

// remote
@riverpod
SupabaseSectionsRemoteDataSource sectionsRemoteDatasource(Ref ref) {
  return SupabaseSectionsRemoteDataSource(
    datasource: sectionsNetworkDatasource(ref),
  );
}

// local
@riverpod
DriftSectionsLocalDataSource sectionsLocalDatasource(Ref ref) {
  final db = appDatabase();
  return DriftSectionsLocalDataSource(db: db);
}

// repo
@riverpod
ISectionsRepository sectionsRepo(Ref ref) {
  final remote = sectionsRemoteDatasource(ref);
  final local = sectionsLocalDatasource(ref);
  final policy = getPolicy();
  return SectionsRepository(remote: remote, local: local, policy: policy);
}

// usecases
@riverpod
GetSectionsUseCaseImpl getSectionsUseCase(Ref ref) {
  final repo = ref.watch(sectionsRepoProvider);
  return GetSectionsUseCaseImpl(repo);
}

@riverpod
GetSectionsFreshnessUseCase getSectionsFreshnessUseCase(Ref ref) {
  final repo = ref.watch(sectionsRepoProvider);
  return GetSectionsFreshnessUseCaseImpl(repo);
}
