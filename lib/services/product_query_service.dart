import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/filters/filter_factory.dart';

// Сервис для запросов и фильтрации продуктов.
// Все методы - чистые функции без состояния.
class ProductQueryService {

  // Маппинг составных жанров фильтра на отдельные жанры в книгах
  static List<String> _getBookGenresForFilter(String filterGenre) {
    final normalized = filterGenre.trim().toLowerCase();
    
    // Составные жанры, которые нужно разбить на отдельные
    switch (normalized) {
      case 'фантастика и фэнтези':
        // Ищем книги с жанром "Фантастика" или "Фэнтези"
        return ['фантастика', 'фэнтези'];
      case 'бизнес и инвестиции':
        // В данных есть только "Бизнес", ищем его
        return ['бизнес'];
      case 'биографии и мемуары':
        // Ищем книги с жанром "Биография" или "Мемуары"
        return ['биография', 'мемуары'];
      case 'детективы и триллеры':
        // В данных есть и составной "Детективы и триллеры", и отдельные "Детектив", "Триллер"
        return ['детективы и триллеры', 'детектив', 'триллер'];
      default:
        return [normalized];
    }
  }

  // Проверка, соответствует ли книга жанру (с учетом составных жанров)
  static bool _bookMatchesGenre(Book book, String filterGenre) {
    final genresToMatch = _getBookGenresForFilter(filterGenre);
    final normalizedGenresToMatch = genresToMatch.map((g) => g.trim().toLowerCase()).toList();
    
    return book.genres.any((bookGenre) {
      final normalizedBookGenre = bookGenre.trim().toLowerCase();
      return normalizedGenresToMatch.contains(normalizedBookGenre);
    });
  }

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

  // Поиск только электронных книг (без аудиокниг) по тегу
  List<Product> getEbooksByTag(List<Product> allProducts, String query) {
    final q = query.toLowerCase();
    return allProducts.where((p) {
      if (p is! Book) return false;
      // Фильтруем только ePub книги (не аудиокниги)
      if (!p.isEbook) return false;
      
      // Проверяем жанры и теги
      final inGenres = p.genres.any((g) => g.toLowerCase().contains(q));
      final inTags = p.tags.any((t) => t.toLowerCase().contains(q));
      return inGenres || inTags;
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

  // -------------------------Похожие продукты-----------------------

  /// Находит похожие продукты на основе тегов и категорий.
  /// Возвращает продукты того же типа с наибольшим количеством совпадающих тегов.
  List<Product> getSimilarProducts(
    List<Product> allProducts,
    Product currentProduct, {
    int maxResults = 15,
  }) {
    // Получаем теги и категории текущего продукта
    final currentTags = currentProduct.tags.map((t) => t.toLowerCase()).toSet();
    
    Set<String> currentCategories = {};
    if (currentProduct is Game) {
      currentCategories = currentProduct.gameGenre.map((g) => g.toLowerCase()).toSet();
    } else if (currentProduct is App) {
      currentCategories = currentProduct.appCategory.map((c) => c.toLowerCase()).toSet();
    } else if (currentProduct is Book) {
      currentCategories = currentProduct.genres.map((g) => g.toLowerCase()).toSet();
    }
    
    // Объединяем теги и категории для поиска
    final allCurrentKeywords = {...currentTags, ...currentCategories};
    
    if (allCurrentKeywords.isEmpty) {
      return [];
    }
    
    // Фильтруем продукты того же типа и считаем совпадения
    final similarProducts = <Product, int>{};
    
    for (final product in allProducts) {
      // Пропускаем текущий продукт
      if (product.id == currentProduct.id) continue;
      
      // Проверяем что тип совпадает
      if (product.runtimeType != currentProduct.runtimeType) continue;
      
      // Получаем теги и категории продукта
      final productTags = product.tags.map((t) => t.toLowerCase()).toSet();
      
      Set<String> productCategories = {};
      if (product is Game) {
        productCategories = product.gameGenre.map((g) => g.toLowerCase()).toSet();
      } else if (product is App) {
        productCategories = product.appCategory.map((c) => c.toLowerCase()).toSet();
      } else if (product is Book) {
        productCategories = product.genres.map((g) => g.toLowerCase()).toSet();
      }
      
      final allProductKeywords = {...productTags, ...productCategories};
      
      // Считаем количество совпадений
      final matchCount = allCurrentKeywords.intersection(allProductKeywords).length;
      
      if (matchCount > 0) {
        similarProducts[product] = matchCount;
      }
    }
    
    // Сортируем по количеству совпадений (по убыванию), затем по рейтингу
    final sortedProducts = similarProducts.entries.toList()
      ..sort((a, b) {
        final matchComparison = b.value.compareTo(a.value);
        if (matchComparison != 0) return matchComparison;
        return b.key.rating.compareTo(a.key.rating);
      });
    
    return sortedProducts.take(maxResults).map((e) => e.key).toList();
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
        return _bookMatchesGenre(product, genre);
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
    final normalizedCategory = category.trim().toLowerCase();
    return allProducts.where((p) {
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
    required bool isFilterOnlyMode,
    // Дополнительные фильтры для книг
    String? selectedAgeFilter,
    String? selectedRatingFilter,
    String? selectedLanguageFilter,
    String? selectedAbridgedVersionFilter,
    double? Function(String)? getMinRatingFromFilter,
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
    // В режиме «только этот фильтр» (например «Новое») не применяем топ-фильтр
    if (!isFilterOnlyMode) {
      if (selectedTopFilter == 'Топ бесплатных') {
        // Только бесплатные продукты, без требования рейтинга
        result = result.where((p) => !p.isPaid).toList();
        debugPrint('После фильтра "$selectedTopFilter": ${result.length} книг');
      } else if (selectedTopFilter == 'Топ платных') {
        result = result.where((p) => p.isPaid && p.rating >= 4.0).toList();
        debugPrint('После фильтра "$selectedTopFilter": ${result.length} книг');
      } else if (selectedTopFilter == 'Бестселлеры') {
        result = result.where((p) => p.rating >= 4.5).toList();
        // Сортировка по рейтингу по убыванию
        result.sort((a, b) => b.rating.compareTo(a.rating));
      } else {
        debugPrint('Фильтр "$selectedTopFilter" не применен: ${result.length} книг');
      }
    } else {
      // Режим «только этот фильтр» — показываем все по выбранному чипу (напр. новинки)
      debugPrint('Режим «только этот фильтр» — показываем все: ${result.length}');
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

    if (currentCategory != 'Все категории' && 
        currentCategory != 'Все') {
      final normalizedCategory = currentCategory.trim().toLowerCase();
      
      result = result.where((p) {
        if (p is Game) {
          return p.gameGenre.any(
            (g) => g.trim().toLowerCase() == normalizedCategory,
          );
        }
        if (p is App) {
          final matches = p.appCategory.any(
            (c) => c.trim().toLowerCase() == normalizedCategory,
          );
          if (matches) {
        
          }
          return matches;
        }
        if (p is Book) {
          return _bookMatchesGenre(p, currentCategory);
        }
        return false;
      }).toList();
      
      // Проверка на пустую категорию после фильтрации
      if (result.isEmpty) {
        debugPrint('Категория пуста! Проверьте совпадение названий.');
      }
    } else {
      debugPrint('Фильтр по категории не применен: ${result.length} книг');
    }

    // В режиме «только этот фильтр» — сортировка по дате (приоритет над рейтингом)
    if (isFilterOnlyMode) {
      result.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    }

    // Дополнительные фильтры для книг
    if (type == FilterType.books) {
      // Фильтр по возрасту (для книг - через жанр "Для детей" или теги)
      if (selectedAgeFilter != null && selectedAgeFilter != 'Все') {
        final beforeAge = result.length;
        result = result.where((p) {
          if (p is Book) {
            // Проверяем наличие жанра "Для детей" (точное или частичное совпадение)
            final hasChildrenGenre = p.genres.any((g) {
              final normalizedGenre = g.trim().toLowerCase();
              return normalizedGenre == 'для детей' || 
                     normalizedGenre.contains('для детей');
            });
            // Проверяем теги на наличие детских тегов
            final hasChildrenTag = p.tags.any((t) {
              final normalizedTag = t.trim().toLowerCase();
              return normalizedTag.contains('детск') || 
                     normalizedTag.contains('детская') ||
                     normalizedTag.contains('для детей');
            });
            
            final isChildrenBook = hasChildrenGenre || hasChildrenTag;
            
            // Для детских категорий показываем только детские книги
            if (selectedAgeFilter == 'До 5 лет' || 
                selectedAgeFilter == 'От 6 до 8 лет' || 
                selectedAgeFilter == 'От 9 до 12 лет') {
              return isChildrenBook;
            }
            // Для "От 13 лет" исключаем детские книги
            if (selectedAgeFilter == 'От 13 лет') {
              return !isChildrenBook;
            }
          }
          return true;
        }).toList();
        debugPrint('5. После фильтра по возрасту "$selectedAgeFilter": $beforeAge → ${result.length} книг');
      }

      // Фильтр по рейтингу
      if (selectedRatingFilter != null && selectedRatingFilter != 'Все' && getMinRatingFromFilter != null) {
        final beforeRating = result.length;
        final minRating = getMinRatingFromFilter(selectedRatingFilter);
        if (minRating != null) {
          result = result.where((p) => p.rating >= minRating).toList();
          debugPrint('6. После фильтра по рейтингу "$selectedRatingFilter" (>=$minRating): $beforeRating → ${result.length} книг');
        }
      }

      // Фильтр по языку
      if (selectedLanguageFilter != null && selectedLanguageFilter != 'Все') {
        final beforeLang = result.length;
        final normalizedLanguageFilter = selectedLanguageFilter.trim().toLowerCase();
        result = result.where((p) {
          if (p is Book) {
            return p.language.trim().toLowerCase() == normalizedLanguageFilter;
          }
          return false;
        }).toList();
        debugPrint('7. После фильтра по языку "$selectedLanguageFilter": $beforeLang → ${result.length} книг');
      }

      // Фильтр по сокращенному изданию
      if (selectedAbridgedVersionFilter != null && selectedAbridgedVersionFilter != 'Все') {
        final beforeAbr = result.length;
        result = result.where((p) {
          if (p is Book) {
            if (selectedAbridgedVersionFilter == 'Сокращенная версия') {
              return p.isAbridged;
            } else if (selectedAbridgedVersionFilter == 'Полная версия') {
              return !p.isAbridged;
            }
          }
          return true;
        }).toList();
        debugPrint('8. После фильтра по изданию "$selectedAbridgedVersionFilter": $beforeAbr → ${result.length} книг');
      }
      
      debugPrint('=== Итого: ${result.length} книг ===');
    }

    return result;
  }
}
