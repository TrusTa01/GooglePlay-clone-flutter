import 'package:flutter/material.dart';
import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider_base.dart';

class GamesProvider extends TabSectionsProviderBase<Game> {
  final ProductService _service = ProductService();

  @override
  String get productsFileName => 'games.json';

  @override
  String get configFileName => 'games_config.json';

  List<Game> get games => products;

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

      final games =
          (results[0] as List<Product>).whereType<Game>().toList();
      final config = results[1] as TabsConfig;
      setData(games, config);
    } catch (e) {
      setError('Ошибка загрузки игр: $e');
      debugPrint(error);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
