import 'package:google_play/features/product/domain/use_cases/get_similar_products_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_play/core/di/di.dart';
import 'package:google_play/features/product/data/data_sources/local/drift_products_local_data_source.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/data_sources/network/supabase_product_remote_datasource.dart';
import 'package:google_play/features/product/data/repositories/cache_first_product_repository.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';
import 'package:google_play/features/product/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/get_product_freshness_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_by_filters_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/get_products_freshness_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/load_products_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/watch_products_by_filters_use_case.dart';
import 'package:google_play/features/product/domain/use_cases/watch_products_use_case.dart';

part 'di.g.dart';

// network
@riverpod
SupabaseProductNetworkDataSource productNetworkDataSource(Ref ref) {
  final executor = queryExecutor(ref);
  return SupabaseProductNetworkDataSource(executor: executor);
}

// remote
@riverpod
SupabaseProductRemoteDataSource productRemoteDataSource(Ref ref) =>
    SupabaseProductRemoteDataSource(datasource: productNetworkDataSource(ref));

// local
@riverpod
DriftProductsLocalDataSource productsLocalDataSource(Ref ref) {
  final db = appDatabase(ref);
  return DriftProductsLocalDataSource(db: db);
}

// repo
@riverpod
IProductsRepository productsRepo(Ref ref) {
  final remote = productRemoteDataSource(ref);
  final local = productsLocalDataSource(ref);
  final policy = freshnessPolicy(ref);

  return CacheFirstProductRepository(
    remote: remote,
    local: local,
    freshnessPolicy: policy,
    fetchBackoffPolicy: fetchBackoffPolicy(ref),
  );
}

// usecases
@riverpod
LoadProductsUseCase loadProductsUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return LoadProductsUseCaseImpl(repo);
}

@riverpod
WatchProductsUseCase watchProductsUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return WatchProductsUseCaseImpl(repo);
}

@riverpod
LoadProductsByFiltersUseCase loadProductsByFiltersUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return LoadProductsByFiltersUseCaseImpl(repo);
}

@riverpod
WatchProductsByFiltersUseCase watchProductsByFiltersUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return WatchProductsByFiltersUseCaseImpl(repo);
}

@riverpod
GetProductByIdUseCase getProductByIdUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return GetProductByIdUseCaseImpl(repo);
}

@riverpod
GetSimilarProductsUseCase getSimilarProductsUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return GetSimilarProductsUseCaseImpl(repo);
}

@riverpod
GetProductFreshnessUseCase getProductFreshnessUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return GetProductFreshnessUseCaseImpl(repo);
}

@riverpod
GetProductsFreshnessUseCase getProductsFreshnessUseCase(Ref ref) {
  final repo = ref.watch(productsRepoProvider);
  return GetProductsFreshnessUseCaseImpl(repo);
}
