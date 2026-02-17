import 'package:flutter/material.dart';
import 'package:google_play/models/config_models/tabs_config.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_service.dart';
import 'package:google_play/services/section_builder_service.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/providers/banners_provider.dart';
import 'package:google_play/providers/tab_sections_provider.dart';

class GamesProvider extends ChangeNotifier implements TabSectionsProvider {
  final ProductService _service = ProductService();
  final ProductQueryService _queryService = ProductQueryService();

  // Данные
  List<Game> _games = [];
  final List<AppBanner> _banners = [];
  TabsConfig? _config; // Новая модель для конфига

  // Состояние загрузки
  bool _isGamesLoaded = false;
  bool _isConfigLoaded = false;
  bool _isLoading = false;
  String? _error;

  // Кэш секций для каждого sub-tab
  final Map<String, List<HomeSection>> _tabSections = {};
  final Map<String, bool> _tabSectionsLoading = {};

  // Рекомендации (топ-7 по рейтингу из игр)
  List<Game> _recommendations = [];

  // Геттеры
  List<Game> get games => _games;
  List<AppBanner> get banners => _banners;
  List<Game> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  @override
  String? get error => _error;
  bool get isDataLoaded => _isGamesLoaded && _isConfigLoaded;

  /// Отложенный notifyListeners, чтобы не вызывать перестроение во время build.
  void _notifyAfterBuild() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  // ГЛАВНЫЙ МЕТОД: Загрузка данных и конфига
  Future<void> loadGamesData(BannersProvider bannersProvider) async {
    // Предотвращаем повторную загрузку
    if (_isGamesLoaded || _isLoading) return;

    _isLoading = true;
    _error = null;
    _notifyAfterBuild();

    try {
      // Параллельная загрузка games.json и games_config.json
      final results = await Future.wait([
        _service.loadProducts('games.json'),
        _service.loadTabsConfig('games_config.json'),
        bannersProvider.loadBanners(), // Загружаем баннеры
      ]);

      // Фильтруем только Game из результата
      _games = (results[0] as List<Product>).whereType<Game>().toList();

      _config = results[1] as TabsConfig;

      // Вычисляем рекомендации (топ-7 по рейтингу)
      _calculateRecommendations();

      _isGamesLoaded = true;
      _isConfigLoaded = true;
    } catch (e) {
      _error = 'Ошибка загрузки игр: $e';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Вычисление рекомендаций
  void _calculateRecommendations() {
    final sorted = List<Game>.from(_games);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    _recommendations = sorted.take(7).toList();
  }

  // ЛЕНИВАЯ ЗАГРУЗКА СЕКЦИЙ ДЛЯ SUB-TAB (интерфейс TabSectionsProvider)
  @override
  Future<List<HomeSection>> getSectionsForTab(
    String tabKey, [
    BannersProvider? bannersProvider,
  ]) async {
    final banners = bannersProvider!;
    // Если секции уже построены - возвращаем из кэша
    if (_tabSections.containsKey(tabKey)) {
      return _tabSections[tabKey]!;
    }

    // Если уже идет загрузка для этого таба - ждем
    if (_tabSectionsLoading[tabKey] == true) {
      // Можно добавить Completer для ожидания
      return [];
    }

    // Если данные еще не загружены - загружаем
    if (!isDataLoaded) {
      await loadGamesData(banners);
    }

    // Проверяем что конфиг загружен
    if (_config == null) {
      return [];
    }

    // Начинаем построение секций
    _tabSectionsLoading[tabKey] = true;
    _notifyAfterBuild();

    try {
      // Получаем конфигурацию для этого таба
      final tabConfig = _config!.tabs[tabKey];

      if (tabConfig == null) {
        debugPrint('Tab config not found for key: $tabKey');
        return [];
      }

      // Создаем SectionBuilder
      final sectionBuilder = SectionBuilderService(
        allProducts: _games.cast<Product>(),
        allBanners: banners.banners,
        recommendations: _recommendations.cast<Product>(),
        queryService: _queryService,
      );

      // Строим секции из конфига
      final sections = sectionBuilder.buildSectionsFromConfig(
        tabConfig.sections,
      );

      // Кэшируем результат
      _tabSections[tabKey] = sections;

      return sections;
    } catch (e) {
      debugPrint('Error building sections for tab $tabKey: $e');
      return [];
    } finally {
      _tabSectionsLoading[tabKey] = false;
      notifyListeners();
    }
  }

  // Проверка загружены ли секции для таба
  bool isTabSectionsLoaded(String tabKey) {
    return _tabSections.containsKey(tabKey);
  }

  // Проверка идет ли загрузка секций для таба
  @override
  bool isTabSectionsLoading(String tabKey) {
    return _tabSectionsLoading[tabKey] == true;
  }

  // Опциональная выгрузка данных (для освобождения памяти)
  void unload() {
    _games.clear();
    _banners.clear();
    _recommendations.clear();
    _tabSections.clear();
    _isGamesLoaded = false;
    _isConfigLoaded = false;
    notifyListeners();
  }

  Product? getProductById(String id) {
    try {
      return _games.firstWhere((g) => g.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Секции для экрана «Для детей по возрасту» с подставленным [ageLabel].
  /// Используется в filter_factory для KidsAgeCategoryScreen.
  /// [bannersProvider] нужен для баннеров в секциях.
  List<HomeSection> getSectionsForKidsAge(
    String ageLabel,
    BannersProvider bannersProvider,
  ) {
    if (_config == null) return [];
    final tabConfig = _config!.tabs['kidsCategory'];
    if (tabConfig == null) return [];
    const placeholder = r'$AGE_LABEL$';
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
      allProducts: _games.cast<Product>(),
      allBanners: bannersProvider.banners,
      recommendations: _recommendations.cast<Product>(),
      queryService: _queryService,
    );
    return sectionBuilder.buildSectionsFromConfig(sectionsWithAge);
  }

  // Фильтрация игр по категории (для виджетов категорий)
  List<Game> getGamesByCategory(String category) {
    final normalized = category.trim().toLowerCase();
    return _games.where((game) {
      return game.gameGenre.any((g) => g.trim().toLowerCase() == normalized);
    }).toList();
  }
}
