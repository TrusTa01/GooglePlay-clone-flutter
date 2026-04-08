import 'package:google_play/features/product/domain/usecases/get_products_by_filters_usecase.dart';
import 'package:google_play/features/product/domain/usecases/get_product_freshness_usecase.dart';
import 'package:google_play/features/product/domain/usecases/get_products_freshness_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/datasources/local/i_product_local_datasource.dart';
import 'package:google_play/features/product/data/datasources/local/drift_product_local_datasource.dart';
import 'package:google_play/features/product/data/datasources/network/supabase_product_network_datasource.dart';
import 'package:google_play/features/product/data/repositories/cache_first_product_repository.dart';
import 'package:google_play/features/product/data/datasources/network/supabase_product_network_repository.dart';
import 'package:google_play/features/product/data/datasources/network/i_product_network_repository.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';
import 'package:google_play/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:google_play/features/product/domain/usecases/load_products_usecase.dart';
import 'package:google_play/features/product/domain/usecases/watch_products_by_filters_usecase.dart';
import 'package:google_play/features/product/domain/usecases/watch_products_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final productLocalDatasourceProvider = Provider<IProductLocalDatasource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftProductLocalDatasource(db: db);
});

final supabaseProductNetworkDatasourceProvider =
    Provider<SupabaseProductNetworkDatasource>((ref) {
      return SupabaseProductNetworkDatasource(Supabase.instance.client);
    });

final productNetworkRepositoryProvider = Provider<IProductNetworkRepository>((
  ref,
) {
  final network = ref.watch(supabaseProductNetworkDatasourceProvider);
  return SupabaseProductRepository(network: network);
});

final productRepositoryProvider = Provider<IProductRepository>((ref) {
  final local = ref.watch(productLocalDatasourceProvider);
  final network = ref.watch(productNetworkRepositoryProvider);
  return OfflineFirstProductRepository(local: local, network: network);
});

final loadProductsUseCaseProvider = Provider<LoadProductsUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return LoadProductsUseCaseImpl(repo);
});

final getProductByIdUseCaseProvider = Provider<GetProductsByIdUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return GetProductByIdUseCaseImpl(repo);
});

final loadProductsByFiltersUseCaseProvider =
    Provider<LoadProductsByFiltersUseCase>((ref) {
      final repo = ref.watch(productRepositoryProvider);
      return LoadProductsByFiltersUseCaseImpl(repo);
    });

final watchProductsUseCaseProvider = Provider<WatchProductsUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return WatchProductsUseCaseImpl(repo);
});

final watchProductsByFiltersUseCaseProvider =
    Provider<WatchProductsByFiltersUseCase>((ref) {
      final repo = ref.watch(productRepositoryProvider);
      return WatchProductsByFiltersUseCaseImpl(repo);
    });

final getProductsFreshnessUseCaseProvider =
    Provider<GetProductsFreshnessUseCase>((ref) {
      final repo = ref.watch(productRepositoryProvider);
      return GetProductsFreshnessUseCaseImpl(repo);
    });

final getProductFreshnessUseCaseProvider = Provider<GetProductFreshnessUseCase>(
  (ref) {
    final repo = ref.watch(productRepositoryProvider);
    return GetProductFreshnessUseCaseImpl(repo);
  },
);
