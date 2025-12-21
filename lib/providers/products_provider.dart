import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/product_service.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  // Сами данные
  List<Product> _allProducts = [];
  bool _isLoading = false;
  String? _error;
  List<Product> _recommendedGames = [];

  // Геттеры для доступа из виджетов
  List<Product> get allProducts => _allProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Product> get recommendedGames => _recommendedGames;

  Future<void> loadAllProducts() async {
    if (_allProducts.isNotEmpty) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Приложение продолжит работу если один из json упал
      final results = await Future.wait([
        _service.loadProducts('games.json').catchError((e) {
          debugPrint('Ошибка загрузки игр: $e');
          return <Product>[];
        }),
        _service.loadProducts('apps.json').catchError((e) {
          debugPrint('Ошибка загрузки приложений: $e');
          return <Product>[];
        }),
        _service.loadProducts('books.json').catchError((e) {
          debugPrint('Ошибка загрузки книг: $e');
          return <Product>[];
        }),
      ]);
      // Склеиваем всё в один список
      _allProducts = results.expand((list) => list).toList();

      List<Product> sortedList = List.from(_allProducts);
      sortedList.sort((a, b) => b.rating.compareTo(a.rating));
      _recommendedGames = sortedList.take(7).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      // Если все списки пустые, а ошибки в перехватчике не было,
      // можно пометить это как специфическую ошибку "Данные отсутствуют"
      if (_allProducts.isEmpty && _error == null) {
        _error = "Не удалось загрузить ни одного раздела";
      }
      notifyListeners();
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
