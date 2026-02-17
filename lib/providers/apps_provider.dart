import 'package:flutter/material.dart';
import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/services/section_builder_service.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider.dart';

class AppsProvider extends ChangeNotifier implements TabSectionsProvider {
  final ProductService _service = ProductService();
  final ProductQueryService _queryService = ProductQueryService();

  List<App> _apps = [];
  TabsConfig? _config;
  bool _isAppsLoaded = false;
  bool _isConfigLoaded = false;
  bool _isLoading = false;
  String? _error;

  final Map<String, List<HomeSection>> _tabSections = {};
  final Map<String, bool> _tabSectionsLoading = {};

  List<App> _recommendations = [];

  // Геттеры
  List<App> get apps => _apps;
  List<App> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  @override
  String? get error => _error;
  bool get isDataLoaded => _isAppsLoaded && _isConfigLoaded;

  void _notifyAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  Future<void> loadAppsData(BannersProvider bannersProvider) async {
    if (_isAppsLoaded || _isLoading) return;

    _isLoading = true;
    _error = null;
    _notifyAfterBuild();

    try {
      final results = await Future.wait([
        _service.loadProducts('apps.json'),
        _service.loadTabsConfig('apps_config.json'),
        bannersProvider.loadBanners(), // Переиспользуем баннеры
      ]);

      _apps = (results[0] as List<Product>).whereType<App>().toList();

      _config = results[1] as TabsConfig;

      _calculateRecommendations();

      _isAppsLoaded = true;
      _isConfigLoaded = true;
    } catch (e) {
      _error = 'Ошибка загрузки приложений: $e';
    }
  }

  void _calculateRecommendations() {
    final sorted = List<App>.from(_apps);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    _recommendations = sorted.take(7).toList();
  }

  @override
  Future<List<HomeSection>> getSectionsForTab(
    String tabKey, [
    BannersProvider? bannersProvider,
  ]) async {
    final banners = bannersProvider!;
    if (_tabSections.containsKey(tabKey)) {
      return _tabSections[tabKey]!;
    }

    if (!isDataLoaded) {
      await loadAppsData(banners);
    }

    if (_config == null) return [];

    _tabSectionsLoading[tabKey] = true;
    _notifyAfterBuild();

    try {
      final tabConfig = _config!.tabs[tabKey];
      if (tabConfig == null) return [];

      final sectionBuilder = SectionBuilderService(
        allProducts: _apps.cast<Product>(),
        allBanners: banners.banners,
        recommendations: _recommendations.cast<Product>(),
        queryService: _queryService,
      );

      final sections = sectionBuilder.buildSectionsFromConfig(
        tabConfig.sections,
      );
      _tabSections[tabKey] = sections;
      return sections;
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    } finally {
      _tabSectionsLoading[tabKey] = false;
      notifyListeners();
    }
  }

  Product? getProductById(String id) {
    try {
      return _apps.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }

  bool isTabSectionsLoaded(String tabKey) => _tabSections.containsKey(tabKey);
  @override
  bool isTabSectionsLoading(String tabKey) =>
      _tabSectionsLoading[tabKey] == true;

  void unload() {
    _apps.clear();
    _recommendations.clear();
    _tabSections.clear();
    _isAppsLoaded = false;
    _isConfigLoaded = false;
    notifyListeners();
  }
}
