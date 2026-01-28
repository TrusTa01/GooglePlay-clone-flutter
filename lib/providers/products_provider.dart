import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/product_service.dart';
import '../services/product_query_service.dart';
import '../services/section_builder_service.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductService _service = ProductService();
  final ProductQueryService _queryService = ProductQueryService();
  SectionBuilderService? _sectionBuilder;

  List<Product> _allProducts = [];
  bool _isLoading = false;
  String? _error;
  List<Product> _recommendations = [];
  List<AppBanner> _allBanners = [];
  List<PageConfig> _pageConfigs = [];

  // Вкладки игр
  List<HomeSection> _recommendedGamesSection = [];
  List<HomeSection> _paidGamesSection = [];
  List<HomeSection> _kidsPaidSection = [];
  List<HomeSection> _recommendedAppsSection = [];
  List<HomeSection> _recommendedBooksSection = [];

  // Геттеры
  List<Product> get allProducts => _allProducts;
  List<Product> get games => _allProducts.whereType<Game>().toList();
  List<Product> get apps => _allProducts.whereType<App>().toList();
  List<Product> get books => _allProducts.whereType<Book>().toList();
  
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Product> get recommendations => _recommendations;
  List<AppBanner> get allBanners => _allBanners;
  List<PageConfig> get pageConfigs => _pageConfigs;

  List<HomeSection> get recommendedGamesSection => _recommendedGamesSection;
  List<HomeSection> get paidGamesSection => _paidGamesSection;
  List<HomeSection> get kidsPaidSection => _kidsPaidSection;
  List<HomeSection> get recommendedAppsSection => _recommendedAppsSection;
  List<HomeSection> get recommendedBooksSection => _recommendedBooksSection;

  PageConfig? getPageConfig(String id) {
    try {
      return _pageConfigs.firstWhere((config) => config.id == id);
    } catch (e) {
      debugPrint('PageConfig with id "$id" not found');
      return null;
    }
  }

  Future<void> loadAllProducts() async {
    if (_allProducts.isNotEmpty) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Приложение продолжит работу если один из json упал
      final results = await Future.wait([
        _service.loadProducts('games.json').catchError((e) => <Product>[]),
        _service.loadProducts('apps.json').catchError((e) => <Product>[]),
        _service.loadProducts('books.json').catchError((e) => <Product>[]),
        _service.loadBanners().catchError((e) => <AppBanner>[]),
        _service.loadPageConfigs().catchError((e) => <PageConfig>[]),
      ]);
      // Склеиваем всё в один список
      _allProducts = [
        ...results[0] as List<Product>,
        ...results[1] as List<Product>,
        ...results[2] as List<Product>,
      ];

      _allBanners = results[3] as List<AppBanner>;
      _pageConfigs = results[4] as List<PageConfig>;

      notifyListeners();

      await getRecomendations();

      // Все данные в памяти, можно готовить секции
      _prepareAllSections();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      // Если все списки пустые, а ошибки в перехватчике не было,
      if (_allProducts.isEmpty && _error == null) {
        _error = "Не удалось загрузить ни одного раздела";
      }
      notifyListeners();
    }
  }

  // Инициализация SectionBuilderService с актуальными данными
  void _initSectionBuilder() {
    _sectionBuilder = SectionBuilderService(
      allProducts: _allProducts,
      allBanners: _allBanners,
      recommendations: _recommendations,
      pageConfigs: _pageConfigs,
      queryService: _queryService,
    );
  }

  // Получить баннера определенного типа
  List<AppBanner> getBannersByPrefix(String prefix) {
    return _allBanners.where((b) {
      if (b is ActionBanner) return b.productId.startsWith(prefix);
      return true;
    }).toList();
  }

  List<Product> getProductsByCategory(String category, {required bool isGame}) {
    final normalizedCategory = category.trim().toLowerCase();
    return _allProducts.where((p) {
      if (isGame) {
        return p is Game && p.gameGenre.any(
          (g) => g.trim().toLowerCase() == normalizedCategory,
        );
      }
      return p is App && p.appCategory.any(
        (c) => c.trim().toLowerCase() == normalizedCategory,
      );
    }).toList();
  }

  // Этот метод "склеивает" данные в секции, которые ждет GenericTabScreen
  void _prepareAllSections() {
    _initSectionBuilder();
    if (_sectionBuilder == null) return;

    // Секции для вкладки игр
    _recommendedGamesSection = _sectionBuilder!.buildGamesRecommendedPage();
    _paidGamesSection = _sectionBuilder!.buildGamesPaidPage();

    _kidsPaidSection = _sectionBuilder!.buildKidsPage();
    // Секции для вкладки приложений
    _recommendedAppsSection = _sectionBuilder!.buildAppsRecommendedPage();

    // Секции для вкладки книг
    _recommendedBooksSection = _sectionBuilder!.buildBooksRecommendedPage();
  }

  // Логика рекомендаций, берем 7 самых высоко оцененных продуктов
  Future<void> getRecomendations() async {
    if (_recommendations.isNotEmpty) return;

    _isLoading = true;
    notifyListeners();
    try {
      List<Product> allAvailable = List.from(_allProducts);
      allAvailable.sort((a, b) => b.rating.compareTo(a.rating));
      _recommendations = allAvailable.take(7).toList();
    } catch (e) {
      _error = "Ошибка при выборе лучших товаров: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Метод-поиск, передаем id из баннера, а сервис возвращает продукт или null
  Product? getProductById(String id) {
    if (_allProducts.isEmpty) return null;
    try {
      return _allProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  // Получить секции для экрана события
  List<HomeSection> getEventSections(SimpleBanner eventBanner) {
    if (_sectionBuilder == null) return [];
    return _sectionBuilder!.buildEventSections(eventBanner);
  }

}