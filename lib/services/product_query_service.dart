import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/filters/filter_factory.dart';

// Сервис для запросов и фильтрации продуктов.
// Все методы - чистые функции без состояния.
class ProductQueryService {

  // -------------------------Поиск-----------------------
  // Поиск игр и приложений по запросу
  List<Product> searchGamesAndApps(List<Product> allProducts, String query) {
    if (query.isEmpty) return [];

    return allProducts.where((p) {
      final isGameOrApp = p is Game || p is App;
      final matchesQuery = p.title.toLowerCase().contains(query.toLowerCase());
      return isGameOrApp && matchesQuery;
    }).toList();
  }

  // Поиск книг по запросу
  List<Product> searchBooks(List<Product> allProducts, String query) {
    if (query.isEmpty) return [];

    return allProducts.where((p) {
      final isBook = p is Book;
      final matchesQuery = p.title.toLowerCase().contains(query.toLowerCase());
      return isBook && matchesQuery;
    }).toList();
  }

  // Универсальный поиск по тегу, жанру или названию
  List<Product> getProductsByTag(List<Product> allProducts, String query) {
    final q = query.toLowerCase();
    return allProducts.where((p) {
      // Базовая проверка названия
      if (p.title.toLowerCase().contains(q)) return true;

      // Если это игра, проверяем жанры и теги
      if (p is Game) {
        final inGenres = p.gameGenre.any((g) => g.toLowerCase().contains(q));
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inGenres || inTags;
      }
      
      // Если это приложение, проверяем теги
      if (p is App) {
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inTags;
      }
      
      // Если это книга, проверяем жанры и теги
      if (p is Book) {
        final inGenres = p.genres.any((g) => g.toLowerCase().contains(q));
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inGenres || inTags;
      }
      
      return false;
    }).toList();
  }

  // Поиск по тегу с фильтрацией по возрасту
  List<Product> getProductsByTagAndAge(
    List<Product> allProducts,
    String query,
    String ageLabel,
    Map<String, int> Function(String) getAgeRange,
  ) {
    final ageRange = getAgeRange(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    final q = query.toLowerCase();
    return allProducts.where((p) {
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
      
      // Если это приложение, проверяем теги
      if (p is App) {
        final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
        return inTags;
      }
      
      return false;
    }).toList();
  }

  // -------------------------По категориям-----------------------

  // Получить игры по категории (жанру)
  List<Product> getGamesByCategory(List<Product> allProducts, String genre) {
    return allProducts.whereType<Game>().where((game) {
      return game.gameGenre.any(
        (g) => g.trim().toLowerCase() == genre.trim().toLowerCase(),
      );
    }).toList();
  }

  // Получить книги по категории (жанру)
  List<Product> getBooksByCategory(List<Product> allProducts, String genre) {
    return allProducts.where((product) {
      if (product is Book) {
        return product.genres.contains(genre);
      }
      return false;
    }).toList();
  }

  // Получить игры по категории с фильтрацией по возрасту
  List<Product> getGamesByCategoryAndAge(
    List<Product> allProducts,
    String genre,
    String ageLabel,
    Map<String, int> Function(String) getAgeRange,
  ) {
    final ageRange = getAgeRange(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    return allProducts.whereType<Game>().where((game) {
      final genreMatches = game.gameGenre.any(
        (g) => g.trim().toLowerCase() == genre.trim().toLowerCase(),
      );
      final ageMatches = game.ageRating >= minAge && game.ageRating <= maxAge;
      return genreMatches && ageMatches;
    }).toList();
  }

  // Получить продукты по категории (универсальный метод)
  List<Product> getProductsByCategory(
    List<Product> allProducts,
    String category, {
    required bool isGame,
  }) {
    return allProducts.where((p) {
      if (isGame) return p is Game && p.gameGenre.contains(category);
      return p is App && p.type == category;
    }).toList();
  }

  // -------------------------По возрасту-----------------------

  // Получить игры по возрастному рейтингу
  List<Product> getGamesByAge(List<Product> allProducts, int maxAge) {
    return allProducts.whereType<Game>().where((g) => g.ageRating <= maxAge).toList();
  }

  // Получить продукты по возрастному диапазону (для Kids Tab)
  List<Product> getKidsAgeFilteredProducts(
    List<Product> allProducts,
    int minAge,
    int maxAge,
  ) {
    return allProducts.where((p) {
      if (p is Game) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      } else if (p is App) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      }
      return false;
    }).toList();
  }

  // Получить рекомендации для детей с ageRating <= age
  List<Product> getKidsAgeRecommendations(
    List<Product> recommendations,
    int age,
  ) {
    return recommendations.whereType<Game>().where((g) => g.ageRating <= age).toList();
  }

  // -------------------------Фильтрация рекомендаций по типу-----------------------

  // Получить только игры из рекомендаций
  List<Product> getGameRecommendations(List<Product> recommendations) {
    return recommendations.whereType<Game>().toList();
  }

  // Получить только приложения из рекомендаций
  List<Product> getAppRecommendations(List<Product> recommendations) {
    return recommendations.whereType<App>().toList();
  }

  // Получить реверсированные рекомендации игр
  List<Product> getGameRecommendationsReversed(List<Product> recommendations) {
    return recommendations.whereType<Game>().toList().reversed.toList();
  }

  // Получить реверсированные рекомендации приложений
  List<Product> getAppRecommendationsReversed(List<Product> recommendations) {
    return recommendations.whereType<App>().toList().reversed.toList();
  }

  /// Получить рекомендации для детей с фильтрацией по возрастному диапазону
  List<Product> getKidsAgeRecommendationsByAgeRange(
    List<Product> recommendations,
    String ageLabel,
    Map<String, int> Function(String) getAgeRange,
  ) {
    final ageRange = getAgeRange(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    return recommendations.where((p) {
      if (p is Game) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      } else if (p is App) {
        return p.ageRating >= minAge && p.ageRating <= maxAge;
      }
      return false;
    }).toList();
  }

  // -------------------------По цене и статусу-----------------------

  // Получить платные игры конкретного жанра
  List<Product> getPaidGamesByGenre(List<Product> allProducts, String genre) {
    return allProducts.whereType<Game>().where((g) {
      return g.isPaid && g.gameGenre.contains(genre);
    }).toList();
  }

  // Получить платные продукты с ограничением количества
  List<Product> getAllPaidProductsTake(List<Product> allProducts, int count) {
    final allPaid = allProducts.whereType<Game>().where((g) => g.isPaid).toList();
    return allPaid.take(count).toList();
  }

  // Получить платные продукты дешевле указанной цены
  List<Product> getAllPaidProductsUnderPrice(List<Product> allProducts, int price) {
    final allPaid = allProducts.whereType<Game>().where((g) => g.isPaid).toList();
    return allPaid.where((g) => (g.price ?? 0) < price).toList();
  }

  // Получить игры, которые работают без интернета
  List<Product> getOfflineGames(List<Product> allProducts) {
    return allProducts.whereType<Game>().where((g) => !g.isOnline).toList();
  }

  // -------------------------Фильтрация-----------------------

  // Основной метод фильтрации продуктов
  List<Product> getFilteredProducts(
    List<Product> allProducts, {
    required FilterType type,
    required String selectedTopFilter,
    required String selectedGameCategory,
    required String selectedAppCategory,
    required String selectedBookCategory,
    required bool isRecentFilterActive,
  }) {
    // Фильтруем по типу контента
    List<Product> result = allProducts.where((p) {
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
    if (selectedTopFilter == 'Топ бесплатных') {
      result = result.where((p) => !p.isPaid && p.rating >= 4.0).toList();
    } else if (selectedTopFilter == 'Топ платных') {
      result = result.where((p) => p.isPaid && p.rating >= 4.0).toList();
    } else if (selectedTopFilter == 'Бестселлеры') {
      result = result.where((p) => p.rating >= 4.5).toList();
    }

    // Фильтр по категориям
    String currentCategory;
    if (type == FilterType.games) {
      currentCategory = selectedGameCategory;
    } else if (type == FilterType.apps) {
      currentCategory = selectedAppCategory;
    } else {
      currentCategory = selectedBookCategory;
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
    if (isRecentFilterActive) {
      final recentThreshold = result.length > 10 ? result.length - 10 : 0;
      result = result.sublist(recentThreshold);
    }

    return result;
  }
}
