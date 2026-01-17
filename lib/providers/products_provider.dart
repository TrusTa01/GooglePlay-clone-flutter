import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/product_service.dart';
import '../screens/screens.dart';
import '../widgets/filters/filter_factory.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _allProducts = [];
  bool _isLoading = false;
  String? _error;
  List<Product> _recommendations = [];
  List<AppBanner> _allBanners = [];

  // Фильтры
  String _selectedGameCategory = 'Все категории';
  String _selectedAppCategory = 'Все категории';
  String _selectedBookCategory = 'Жанр';

  String _selectedTopFilter = 'Топ бесплатных';
  final String _selectedRecentFilter = 'Новое';
  bool _isRecentFilterActive = false;
  final List<String> topFilterOptions = [
    'Топ бесплатных',
    'Бестселлеры',
    'Топ платных',
  ];

  // Вкладки игр
  List<HomeSection> _recommendedGamesSection = [];

  // Вкладки приложений

  List<Product> get allProducts => _allProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Product> get recommendations => _recommendations;
  List<AppBanner> get allBanners => _allBanners;

  // Фильтры
  String get selectedTopFilter => _selectedTopFilter;
  String get selectedGameCategory => _selectedGameCategory;
  String get selectedAppCategory => _selectedAppCategory;
  String get selectedBookCategory => _selectedBookCategory;
  String get selectedRecentFilter => _selectedRecentFilter;
  bool get isRecentFilterActive => _isRecentFilterActive;

  List<HomeSection> get recommendedGamesSection => _recommendedGamesSection;

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
      ]);
      // Склеиваем всё в один список
      _allProducts = [
        ...results[0] as List<Product>,
        ...results[1] as List<Product>,
        ...results[2] as List<Product>,
      ];

      _allBanners = results[3] as List<AppBanner>;

      _prepareAllSections();

      notifyListeners();

      getRecomendations();

      // Все данные в памяти, можно готовить секции
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

  // Получить баннера определенного типа
  List<AppBanner> getBannersByPrefix(String prefix) {
    return _allBanners.where((b) {
      if (b is ActionBanner) return b.productId.startsWith(prefix);
      return true;
    }).toList();
  }

  List<Product> getProductsByCategory(String category, {required bool isGame}) {
    return _allProducts.where((p) {
      if (isGame) return p is Game && p.gameGenre == category;
      return p is App && p.type == category;
    }).toList();
  }

  // Этот метод "склеивает" данные в секции, которые ждет GenericTabScreen
  void _prepareAllSections() {
    final builder = PageBuilder(this);

    // Секции для вкладки игр
    _recommendedGamesSection = builder.buildGamesRecommendedPage();

    // Секции для вкладки приложений
  }

  // Логика рекомендаций, берем 7 самых высоко оцененных продуктов
  Future<void> getRecomendations() async {
    if (_recommendations.isNotEmpty) return;

    _isLoading = true;
    notifyListeners();

    // Небольшая пауза, чтобы пользователь увидел анимацию загрузки (шиммеры)
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      List<Product> allAvailable = List.from(_allProducts);
      allAvailable.sort((a, b) => b.rating.compareTo(a.rating));
      _recommendations = allAvailable.take(7).toList();

      // Собираем структуру страниц, чтобы UI увидел данные
      _prepareAllSections();
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

  // Поиск по категориям
  // Поиск игр и приложений общий
  List<Product> searchGamesAndApps(String query) {
    if (query.isEmpty) return [];

    return _allProducts.where((p) {
      // Условие: это должна быть либо игра, либо приложение
      final isGameOrApp = p is Game || p is App;
      // И название должно содержать запрос
      final matchesQuery = p.title.toLowerCase().contains(query.toLowerCase());

      return isGameOrApp && matchesQuery;
    }).toList();
  }

  // Поиск только для книг
  List<Product> searchBooks(String query) {
    if (query.isEmpty) return [];

    return _allProducts.where((p) {
      // Условие: это должна быть только книга
      final isBook = p is Book;
      final matchesQuery = p.title.toLowerCase().contains(query.toLowerCase());

      return isBook && matchesQuery;
    }).toList();
  }

  // Поиск по названию
  // Метод поиска игр по категориям
  List<Product> getGamesByCategory(String genre) {
    return _allProducts.where((product) {
      if (product is Game) {
        // Сравниваем жанр игры с тем, что мы ищем
        return product.gameGenre == genre;
      }
      return false;
    }).toList();
  }

  // // Метод поиска приложений по категориям
  //   List<Product> getAppsByCategory(String genre) {
  //   return _allProducts.where((product) {
  //     if (product is App) {
  //       // Сравниваем жанр приложения с тем, что мы ищем
  //       // !!!!!!!!!!! Поменять категорию на жанр приложения
  //       return product.type == genre;
  //     }
  //     return false;
  //   }).toList();
  // }

  // Метод поиска книг по категориям
  List<Product> getBooksByCategory(String genre) {
    return _allProducts.where((product) {
      if (product is Book) {
        // Сравниваем жанр книги с тем, что мы ищем
        return product.genres.contains(genre);
      }
      return false;
    }).toList();
  }

  // Фильтры
  void setTopFilter(String value) {
    _selectedTopFilter = value;
    notifyListeners();
  }

  void updateGameCategory(String value) {
    _selectedGameCategory = value;
    notifyListeners();
  }

  void updateAppCategory(String value) {
    _selectedAppCategory = value;
    notifyListeners();
  }

  void updateBookCategory(String value) {
    _selectedBookCategory = value;
    notifyListeners();
  }

  void toggleRecentOnly() {
    _isRecentFilterActive = !_isRecentFilterActive;
    notifyListeners();
  }

  List<Product> getFilteredProducts(FilterType type) {
    // Сначала фильтруем по типу контента
    // Чтобы на странице Игр не было Книг и наоборот
    List<Product> result = _allProducts.where((p) {
      switch (type) {
        case FilterType.games:
          return p is Game;
        case FilterType.apps:
          return p is App;
        case FilterType.booksTop:
        case FilterType.booksNovelty:
        case FilterType.booksTopFree:
          return p is Book;
      }
    }).toList();

    // Фильтруем по основному статусу (Бесплатные/Платные/Бестселлеры)
    if (_selectedTopFilter == 'Топ бесплатных') {
      result = result.where((p) => !p.isPaid).toList();
    } else if (_selectedTopFilter == 'Топ платных') {
      result = result.where((p) => p.isPaid).toList();
    } else if (_selectedTopFilter == 'Бестселлеры') {
      result = result.where((p) => p.rating >= 4.0).toList();
    }

    // Фильтр по категориям
    String currentCategory;
    if (type == FilterType.games) {
      currentCategory = _selectedGameCategory;
    } else if (type == FilterType.apps) {
      currentCategory = _selectedAppCategory;
    } else {
      currentCategory = _selectedBookCategory;
    }

    if (currentCategory != 'Все категории' && currentCategory != 'Жанр') {
      result = result.where((p) {
        if (p is Game) return p.gameGenre == currentCategory;
        if (p is App) return p.type == currentCategory;
        if (p is Book) return p.genres.contains(currentCategory);
        return false;
      }).toList();
    }

    // Фильтр Новое
    if (_isRecentFilterActive) {
      final recentThreshold = result.length > 10 ? result.length - 10 : 0;
      result = result.sublist(recentThreshold);
    }

    return result;
  }
}
