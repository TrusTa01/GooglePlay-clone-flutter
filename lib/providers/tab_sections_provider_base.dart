import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/section_builder_service.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/services/product_index.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider.dart';

/// Общая логика для провайдеров с табами и секциями (Games, Apps, Books).
/// Рекомендации: топ-7 по рейтингу. Секции строятся из конфига через [SectionBuilderService].
abstract class TabSectionsProviderBase<T extends Product> extends ChangeNotifier
    implements TabSectionsProvider {
  TabSectionsProviderBase() {
    _queryService = ProductQueryService();
  }

  late final ProductQueryService _queryService;

  List<T> _products = [];
  TabsConfig? _config;
  List<T> _recommendations = [];
  ProductIndex? _productIndex;
  bool _isProductsLoaded = false;
  bool _isConfigLoaded = false;
  bool _isLoading = false;
  String? _error;

  final Map<String, List<HomeSection>> _tabSections = {};
  final Map<String, bool> _tabSectionsLoading = {};
  final Map<String, Completer<List<HomeSection>>> _tabCompleters = {};

  List<T> get products => _products;
  List<T> get recommendations => _recommendations;
  TabsConfig? get config => _config;
  bool get isLoading => _isLoading;
  @override
  String? get error => _error;
  bool get isDataLoaded => _isProductsLoaded && _isConfigLoaded;

  /// Имена файлов данных и конфига. Переопределяются в наследниках.
  String get productsFileName;
  String get configFileName;

  /// Вызывается из [loadData] после загрузки — задаёт продукты и конфиг, считает рекомендации.
  void setData(List<T> products, TabsConfig tabsConfig) {
    _products = products;
    _config = tabsConfig;
    _calculateRecommendations();
    _productIndex = ProductIndex.build(
      products.cast<Product>(),
      _recommendations.cast<Product>(),
    );
    _isProductsLoaded = true;
    _isConfigLoaded = true;
  }

  void setLoading(bool value) => _isLoading = value;

  void setError(String? value) => _error = value;

  void _notifyAfterBuild() =>
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());

  /// Вызвать в начале [loadData] в наследнике, чтобы UI обновился после build.
  void notifyLoadingStarted() => _notifyAfterBuild();

  /// Рекомендации: топ-7 по рейтингу. Общая логика для всех типов продуктов.
  void _calculateRecommendations() {
    final sorted = List<T>.from(_products)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    _recommendations = sorted.take(7).toList();
  }

  /// Загрузка данных. Наследник должен загрузить продукты и конфиг и вызвать [setData].
  Future<void> loadData([BannersProvider? bannersProvider]);

  /// Баннеры для построения секций. По умолчанию из [bannersProvider] или пусто.
  List<AppBanner> bannersForSections(BannersProvider? bannersProvider) =>
      bannersProvider?.banners ?? [];

  @override
  Future<List<HomeSection>> getSectionsForTab(
    String tabKey, [
    BannersProvider? bannersProvider,
  ]) async {
    if (_tabSections.containsKey(tabKey)) {
      return _tabSections[tabKey]!;
    }

    if (_tabSectionsLoading[tabKey] == true) {
      return _tabCompleters[tabKey]!.future;
    }

    final completer = Completer<List<HomeSection>>();
    _tabCompleters[tabKey] = completer;
    _tabSectionsLoading[tabKey] = true;
    _notifyAfterBuild(); // Шиммер с первого кадра

    if (!isDataLoaded) {
      await loadData(bannersProvider);
    }

    if (_config == null) {
      _tabSections[tabKey] = [];
      if (!_tabCompleters[tabKey]!.isCompleted) completer.complete([]);
      _tabSectionsLoading[tabKey] = false;
      _tabCompleters.remove(tabKey);
      notifyListeners();
      return [];
    }

    _notifyAfterBuild();

    try {
      final tabConfig = _config!.tabs[tabKey];
      if (tabConfig == null) {
        _tabSections[tabKey] = [];
        if (!_tabCompleters[tabKey]!.isCompleted) completer.complete([]);
        return [];
      }

      final sectionBuilder = SectionBuilderService(
        productIndex: _productIndex!,
        allBanners: bannersForSections(bannersProvider),
        recommendations: _recommendations.cast<Product>(),
        queryService: _queryService,
      );

      final sections = sectionBuilder.buildSectionsFromConfig(
        tabConfig.sections,
      );
      _tabSections[tabKey] = sections;

      if (!_tabCompleters[tabKey]!.isCompleted) {
        completer.complete(sections);
      }

      return sections;
    } catch (e) {
      debugPrint('TabSectionsProviderBase error: $e');
      if (!_tabCompleters[tabKey]!.isCompleted) {
        completer.completeError(e);
      }
      return [];
    } finally {
      _tabSectionsLoading[tabKey] = false;
      _tabCompleters.remove(tabKey);
      notifyListeners();
    }
  }

  /// Секции для таба с подстановкой плейсхолдера (например «Для детей по возрасту»).
  /// Подставляет [ageLabel] вместо [placeholder] в dataParams и строит секции.
  List<HomeSection> getSectionsWithParamSubstitution(
    String tabKey,
    String placeholder,
    String ageLabel, [
    BannersProvider? bannersProvider,
  ]) {
    if (_config == null) return [];
    final tabConfig = _config!.tabs[tabKey];
    if (tabConfig == null) return [];

    final sectionsWithAge = tabConfig.sections.map((s) {
      final params = s.dataParams != null
          ? Map<String, dynamic>.from(s.dataParams!)
          : <String, dynamic>{};
      for (final k in params.keys.toList()) {
        if (params[k] == placeholder) params[k] = ageLabel;
      }
      if (!params.containsKey('ageLabel')) params['ageLabel'] = ageLabel;
      return SectionConfig(
        type: s.type,
        title: s.title,
        subtitle: s.subtitle,
        imageAssetPath: s.imageAssetPath,
        showButton: s.showButton,
        needsTopPadding: s.needsTopPadding,
        dataMethod: s.dataMethod,
        dataParams: params,
      );
    }).toList();

    final sectionBuilder = SectionBuilderService(
      productIndex: _productIndex!,
      allBanners: bannersForSections(bannersProvider),
      recommendations: _recommendations.cast<Product>(),
      queryService: _queryService,
    );
    return sectionBuilder.buildSectionsFromConfig(sectionsWithAge);
  }

  /// Секции для экрана «Для детей по возрасту»: таб kidsCategory с подставленным [ageLabel].
  @override
  List<HomeSection> getSectionsForKidsAge(
    String ageLabel,
    BannersProvider? bannersProvider,
  ) {
    return getSectionsWithParamSubstitution(
      'kidsCategory',
      r'$AGE_LABEL$',
      ageLabel,
      bannersProvider,
    );
  }

  bool isTabSectionsLoaded(String tabKey) => _tabSections.containsKey(tabKey);

  @override
  bool isTabSectionsLoading(String tabKey) =>
      _tabSectionsLoading[tabKey] == true;

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  void unload() {
    _products = [];
    _recommendations = [];
    _config = null;
    _productIndex = null;
    _tabSections.clear();
    _tabCompleters.clear();
    _tabSectionsLoading.clear();
    _isProductsLoaded = false;
    _isConfigLoaded = false;
    notifyListeners();
  }
}
