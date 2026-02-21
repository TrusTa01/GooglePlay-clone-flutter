import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider_base.dart';

class AppsProvider extends TabSectionsProviderBase<App> {
  final ProductService _service = ProductService();

  AppsProvider({required super.queryService});

  @override
  String get productsFileName => 'apps.json';

  @override
  String get configFileName => 'apps_config.json';

  List<App> get apps => products;

  @override
  Future<void> loadData([BannersProvider? bannersProvider]) async {
    if (isDataLoaded || isLoading) return;
    final banners = bannersProvider;

    setLoading(true);
    setError(null);
    notifyLoadingStarted();

    try {
      final results = await Future.wait([
        _service.loadProducts(productsFileName),
        _service.loadTabsConfig(configFileName),
        banners?.loadBanners() ?? Future.value(),
      ]);

      final appsList = (results[0] as List<Product>).whereType<App>().toList();
      final config = results[1] as TabsConfig;
      setData(appsList, config);
    } catch (e) {
      setError('Ошибка загрузки приложений: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
