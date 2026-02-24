import 'package:google_play/data/models/config_models/tabs_config.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/repositories/product_repository.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider_base.dart';

class ProductCategoryProvider extends TabSectionsProviderBase<ProductEntity> {
  final IProductRepository _repository;
  final String categoryType;
  final String configPath;

  ProductCategoryProvider({
    required IProductRepository repository,
    required this.categoryType,
    required this.configPath,
  }) : _repository = repository;

  @override
  Future<void> loadData([BannersProvider? bannersProvider]) async {
    if (isDataLoaded || isLoading) return;

    setLoading(true);
    setError(null);
    notifyLoadingStarted();

    try {
      final results = await Future.wait([
        _repository.getProducts(type: categoryType),
        _loadTabsConfig(configPath),
        bannersProvider?.loadBanners() ?? Future.value(),
      ]);

      setData(results[0] as List<ProductEntity>, results[1] as TabsConfig);
    } catch (e) {
      setError('Loading error ($categoryType): $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
