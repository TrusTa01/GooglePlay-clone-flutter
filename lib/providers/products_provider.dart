import 'package:flutter/material.dart' hide Banner;

import '../models/models.dart';
import '../services/product_service.dart';
import '../screens/screens.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _allProducts = [];
  bool _isLoading = false;
  String? _error;
  List<Product> _recommendations = [];
  List<AppBanner> _allBanners = [];
  // Вкладки игр
  List<HomeSection> _recommendedGamesSection = [];
  List<HomeSection> _categoriesSection = [];

  // Вкладки приложений

  List<Product> get allProducts => _allProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Product> get recommendations => _recommendations;
  List<AppBanner> get allBanners => _allBanners;

  List<HomeSection> get recommendedGamesSection => _recommendedGamesSection;
  List<HomeSection> get categogoriesSection => _categoriesSection;

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
    _categoriesSection = builder.buildGamesCategoriesPage();

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
      // Условие: это должна быть только Книга
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
}
