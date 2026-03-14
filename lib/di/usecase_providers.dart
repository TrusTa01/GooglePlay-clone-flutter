import 'package:google_play/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/data/datasources/local/product_local_datasource.dart';
import 'package:google_play/data/repositories/json_config_repository.dart';
import 'package:google_play/data/repositories/json_product_repository.dart';
import 'package:google_play/domain/usecases/products/load_products_usecase.dart';
import 'package:google_play/domain/usecases/sections/get_tab_sections_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Datasources
final _productLocalDatasourceProvider =
    Provider<ProductLocalDatasource>((ref) => ProductLocalDatasource());

final _configLocalDatasourceProvider =
    Provider<ConfigLocalDatasource>((ref) => ConfigLocalDatasource());

// Repositories
final productRepositoryProvider = Provider<JsonProductRepository>((ref) {
  final ds = ref.watch(_productLocalDatasourceProvider);
  return JsonProductRepository(ds);
});

final configRepositoryProvider = Provider<JsonConfigRepository>((ref) {
  final ds = ref.watch(_configLocalDatasourceProvider);
  return JsonConfigRepository(ds);
});

// Use cases
final loadProductsUseCaseProvider =
    Provider<LoadProductsUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return LoadProductsUseCaseImpl(repo);
});

final getTabSectionsUseCaseProvider =
    Provider<GetTabSectionsUseCase>((ref) {
  final repo = ref.watch(configRepositoryProvider);
  return GetTabSectionsUseCaseImpl(repo);
});

