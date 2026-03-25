import 'package:google_play/features/sections/data/datasources/local/config_local_datasource.dart';
import 'package:google_play/features/product/data/datasources/product_local_datasource.dart';
import 'package:google_play/features/banners/data/repositories/json_banner_repository.dart';
import 'package:google_play/features/sections/data/repositories/json_config_repository.dart';
import 'package:google_play/features/product/data/repositories/json_product_repository.dart';
import 'package:google_play/features/banners/domain/repositories/banner_repository.dart';
import 'package:google_play/features/sections/domain/repositories/config_repository.dart';
import 'package:google_play/features/product/domain/repositories/product_repository.dart';
import 'package:google_play/features/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:google_play/features/product/domain/usecases/load_products_usecase.dart';
import 'package:google_play/domain/usecases/events/build_event_screen_usecase.dart';
import 'package:google_play/features/tabs/domain/usecases/get_available_tabs_usecase.dart';
import 'package:google_play/features/tabs/domain/usecases/get_tab_sections_usecase.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Datasources
final _productLocalDatasourceProvider = Provider<ProductLocalDatasource>(
  (ref) => ProductLocalDatasource(),
);

final _configLocalDatasourceProvider = Provider<ConfigLocalDatasource>(
  (ref) => ConfigLocalDatasource(),
);

// Repositories
final productRepositoryProvider = Provider<IProductRepository>((ref) {
  final ds = ref.watch(_productLocalDatasourceProvider);
  return JsonProductRepository(ds);
});
final bannerRepositoryProvider = Provider<IBannerRepository>((ref) {
  final ds = ref.watch(_productLocalDatasourceProvider);
  return JsonBannerRepository(ds);
});
final configRepositoryProvider = Provider<IConfigRepository>((ref) {
  final ds = ref.watch(_configLocalDatasourceProvider);
  return JsonConfigRepository(ds);
});

// Use cases
final loadProductsUseCaseProvider = Provider<LoadProductsUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return LoadProductsUseCaseImpl(repo);
});

final getProductByIdUseCaseProvider = Provider<GetProductByIdUseCase>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return GetProductByIdUseCaseImpl(repo);
});

final getTabSectionsUseCaseProvider = Provider<GetTabSectionsUseCase>((ref) {
  final repo = ref.watch(configRepositoryProvider);
  return GetTabSectionsUseCaseImpl(repo);
});

final getAvailableTabsUseCaseProvider = Provider<GetAvailableTabsUseCase>((
  ref,
) {
  final repo = ref.watch(configRepositoryProvider);
  return GetAvailableTabsUseCaseImpl(repo);
});

final resolveSectionUseCaseProvider = Provider<ResolveSectionUsecase>((ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  final bannerRepo = ref.watch(bannerRepositoryProvider);
  return ResolveSectionUsecase(
    productRepo: productRepo,
    bannerRepo: bannerRepo,
  );
});

final buildEventScreenUseCaseProvider = Provider<BuildEventScreenUseCase>(
  (ref) => const BuildEventScreenUseCase(),
);
