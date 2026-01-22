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
  List<PageConfig> _pageConfigs = [];

  // Фильтры
  String _selectedGameCategory = 'Все категории';
  String _selectedAppCategory = 'Все категории';
  String _selectedBookCategory = 'Жанр';
  String _selectedTopFilter = 'Топ бесплатных';
  final String _selectedRecentFilter = 'Новое';
  final String _selectedAgeFilter = 'Возраст';
  final String _selectedRatingFilter = 'По рейтингу';
  final String _selectedLanguageFilter = 'Язык';
  final String _selectedAbridgetVersionFilter = 'Сокращенное издание';
  final List<String> _selectedKidsFilters = [
    'До 5 лет',
    'От 6 до 8 лет',
    'От 9 до 12 лет',
  ];
  bool _isRecentFilterActive = false;

  // Вкладки игр
  List<HomeSection> _recommendedGamesSection = [];
  List<HomeSection> _paidGamesSection = [];

  List<HomeSection> _kidsPaidSection = [];

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
  String get selectedAgeFilter => _selectedAgeFilter;
  String get selectedRatingFilter => _selectedRatingFilter;
  String get selectedLanguageFilter => _selectedLanguageFilter;
  String get selectedAbridgetVersionFilter => _selectedAbridgetVersionFilter;
  List<String> get selectedKidsFilters => _selectedKidsFilters;

  bool get isRecentFilterActive => _isRecentFilterActive;

  List<HomeSection> get recommendedGamesSection => _recommendedGamesSection;
  List<HomeSection> get paidGamesSection => _paidGamesSection;

  List<HomeSection> get kidsPaidSection => _kidsPaidSection;

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
      if (isGame) return p is Game && p.gameGenre.contains(category);
      return p is App && p.type == category;
    }).toList();
  }

  // Этот метод "склеивает" данные в секции, которые ждет GenericTabScreen
  void _prepareAllSections() {
    final builder = PageBuilder(this);

    // Секции для вкладки игр
    _recommendedGamesSection = builder.buildGamesRecommendedPage();
    _paidGamesSection = builder.buildGamesPaidPage();

    _kidsPaidSection = builder.buildKidsPage();
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
    return _allProducts.whereType<Game>().where((game) {
      return game.gameGenre.any(
        (g) => g.trim().toLowerCase() == genre.trim().toLowerCase(),
      );
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

  // Фильтрация
  List<Product> getFilteredProducts(FilterType type) {
    // Сначала фильтруем по типу контента
    // Чтобы на странице Игр не было Книг и наоборот
    List<Product> result = _allProducts.where((p) {
      switch (type) {
        case FilterType.games:
          return p is Game;
        case FilterType.apps:
          return p is App;
        case FilterType.books:
          return p is Book;
        case FilterType.kidsAge:
          return p is Game || p is App;
      }
    }).toList();

    // Фильтруем по основному статусу (Бесплатные/Платные/Бестселлеры)
    if (_selectedTopFilter == 'Топ бесплатных') {
      result = result.where((p) => !p.isPaid && p.rating >= 4.0).toList();
    } else if (_selectedTopFilter == 'Топ платных') {
      result = result.where((p) => p.isPaid && p.rating >= 4.0).toList();
    } else if (_selectedTopFilter == 'Бестселлеры') {
      result = result.where((p) => p.rating >= 4.5).toList();
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
        if (p is Game) return p.gameGenre.contains(currentCategory);
        if (p is App) return p.type == currentCategory;
        if (p is Book) return p.genres.contains(currentCategory);
        if (result.isEmpty) {
          debugPrint('Категория "$currentCategory" пуста');
        }
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

  // Универсальный метод фильтрации по любому признаку (тег, жанр, название)
  List<Product> getProductsByTag(String query) {
    final q = query.toLowerCase();
    return _allProducts.where((p) {
      // Базовая проверка названия
      if (p.title.toLowerCase().contains(q)) return true;

      // Если это игра, проверяем жанры и теги
      if (p is Game) {
        final inGenres = p.gameGenre.any((g) => g.toLowerCase().contains(q));
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inGenres || inTags;
      }
      return false;
    }).toList();
  }

  // Получение игр по возрастному рейтингу (для Kids Tab)
  List<Product> getGamesByAge(int maxAge) {
    return _allProducts.whereType<Game>().where((g) => g.ageRating <= maxAge).toList();
  }

  // Получение платных игр конкретного жанра
  List<Product> getPaidGamesByGenre(String genre) {
    return _allProducts.whereType<Game>().where((g) {
      return g.isPaid && g.gameGenre.contains(genre);
    }).toList();
  }
  
  // Получение игр, которые работают без интернета
  List<Product> getOfflineGames() {
    return _allProducts.whereType<Game>().where((g) => !g.isOnline).toList();
  }

  List<Product> getKidsAgeFilteredProducts(int minAge, int maxAge) {
    return _allProducts.where((p) {
      if (p is Game) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      } else if (p is App) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      }
      return false; // Игнорировать другие типы продуктов
    }).toList();
  }


  Map<String, int> getAgeRangeFromLabel(String ageLabel) {
    int minAge = 0;
    int maxAge = 999;

    switch (ageLabel) {
      case 'До 5 лет':
        minAge = 0;
        maxAge = 5;
        break;
      case 'От 6 до 8 лет':
        minAge = 6;
        maxAge = 8;
        break;
      case 'От 9 до 12 лет':
        minAge = 9;
        maxAge = 12;
        break;
      case '13+ лет':
        minAge = 13;
        maxAge = 999;
        break;
      default:
        minAge = 0;
        maxAge = 999;
    }
    return {'minAge': minAge, 'maxAge': maxAge};
  }

  // Получение платных продуктов с ограничением количества
  List<Product> getAllPaidProductsTake(int count) {
    final allPaid = _allProducts.whereType<Game>().where((g) => g.isPaid).toList();
    return allPaid.take(count).toList();
  }

  // Получение платных продуктов дешевле указанной цены
  List<Product> getAllPaidProductsUnderPrice(int price) {
    final allPaid = _allProducts.whereType<Game>().where((g) => g.isPaid).toList();
    return allPaid.where((g) => (g.price ?? 0) < price).toList();
  }

  // Получение рекомендаций для детей с ageRating <= age
  List<Product> getKidsAgeRecommendations(int age) {
    return _recommendations.whereType<Game>().where((g) => g.ageRating <= age).toList();
  }

  // Получение рекомендаций для детей с фильтрацией по возрастному диапазону
  List<Product> getKidsAgeRecommendationsByAgeRange(String ageLabel) {
    final ageRange = getAgeRangeFromLabel(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    return _recommendations.where((p) {
      if (p is Game) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      } else if (p is App) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      }
      return false;
    }).toList();
  }

  // Получение продуктов по тегу с фильтрацией по возрасту
  List<Product> getProductsByTagAndAge(String query, String ageLabel) {
    final ageRange = getAgeRangeFromLabel(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    final q = query.toLowerCase();
    return _allProducts.where((p) {
      // Проверка возраста
      bool ageMatches = false;
      if (p is Game) {
        ageMatches = p.ageRating >= minAge && p.ageRating <= maxAge;
      } else if (p is App) {
        ageMatches = p.ageRating >= minAge && p.ageRating <= maxAge;
      }
      if (!ageMatches) return false;

      // Базовая проверка названия
      if (p.title.toLowerCase().contains(q)) return true;

      // Если это игра, проверяем жанры и теги
      if (p is Game) {
        final inGenres = p.gameGenre.any((g) => g.toLowerCase().contains(q));
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inGenres || inTags;
      }
      return false;
    }).toList();
  }

  // Получение игр по категории с фильтрацией по возрасту
  List<Product> getGamesByCategoryAndAge(String genre, String ageLabel) {
    final ageRange = getAgeRangeFromLabel(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    return _allProducts.whereType<Game>().where((game) {
      final genreMatches = game.gameGenre.any(
        (g) => g.trim().toLowerCase() == genre.trim().toLowerCase(),
      );
      final ageMatches = game.ageRating >= minAge && game.ageRating <= maxAge;
      return genreMatches && ageMatches;
    }).toList();
  }
}