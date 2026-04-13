import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_play/core/di/di.dart';
import 'package:google_play/features/banners/data/data_sources/local/drift_banners_local_data_source.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_network_datasource.dart';
import 'package:google_play/features/banners/data/data_sources/network/supabase_banners_remote_data_source.dart';
import 'package:google_play/features/banners/data/repositories/cache_first_banners_repository.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banner_by_id_use_case.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banner_freshness_use_case.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_freshness_use_case.dart';
import 'package:google_play/features/banners/domain/use_cases/get_banners_use_case.dart';
import 'package:google_play/features/banners/domain/use_cases/watch_banners_use_case.dart';

part 'di.g.dart';

// network
@riverpod
SupabaseBannerNetworkDataSource bannerNetworkDataSource(Ref ref) {
  final executor = queryExecutor(ref);
  return SupabaseBannerNetworkDataSource(executor: executor);
}

// remote
@riverpod
SupabaseBannerRemoteDataSource bannerRemoteDataSource(Ref ref) =>
    SupabaseBannerRemoteDataSource(datasource: bannerNetworkDataSource(ref));

// local
@riverpod
DriftBannerLocalDataSource bannersLocalDataSource(Ref ref) {
  final db = appDatabase();
  return DriftBannerLocalDataSource(db: db);
}

// repo
@riverpod
IBannersRepository bannersRepo(Ref ref) {
  final remote = bannerRemoteDataSource(ref);
  final local = bannersLocalDataSource(ref);
  final policy = freshnessPolicy();
  final backoffPolicy = fetchBackoffPolicy();

  return CacheFirstBannersRepository(
    remote: remote,
    local: local,
    freshnessPolicy: policy,
    fetchBackoffPolicy: backoffPolicy,
  );
}

// usecases
@riverpod
IGetBannersUseCase getBannersUseCase(Ref ref) {
  final repo = ref.watch(bannersRepoProvider);
  return GetBannersUseCase(repo);
}

@riverpod
IWatchBannersUseCase watchBannersUseCase(Ref ref) {
  final repo = ref.watch(bannersRepoProvider);
  return WatchBannersUseCase(repo);
}

@riverpod
IGetBannerByIdUseCase getBannerByIdUseCase(Ref ref) {
  final repo = ref.watch(bannersRepoProvider);
  return GetBannerByIdUseCase(repo);
}

@riverpod
IGetBannersFreshnessUseCase getBannersFreshnessUseCase(Ref ref) {
  final repo = ref.watch(bannersRepoProvider);
  return GetBannersFreshnessUseCase(repo);
}

@riverpod
IGetBannerFreshnessUseCase getBannerFreshnessUseCase(Ref ref) {
  final repo = ref.watch(bannersRepoProvider);
  return GetBannerFreshnessUseCase(repo);
}
