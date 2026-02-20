import 'package:flutter/material.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/providers/providers.dart';

class AggregatedProductsProvider extends ChangeNotifier {
  // Кеш
  List<Product> _allProducts = [];
  List<Product> _recommendations = [];

  // Ссылки на последние списки из провайдеров
  List? _lastGames;
  List? _lastApps;
  List? _lastBooks;
  List? _lastRecGames;
  List? _lastRecApps;
  List? _lastRecBooks;

  // Геттеры
  List<Product> get allProducts => _allProducts;
  List<Product> get recommendations => _recommendations;

  void update(GamesProvider g, AppsProvider a, BooksProvider b) {
    // Ссылки на списки
    final games = g.games;
    final apps = a.apps;
    final books = b.books;

    final recG = g.recommendations;
    final recA = a.recommendations;
    final recB = b.recommendations;

    // Списки не изменились - не трогаем
    if (_lastGames != null &&
        _lastApps != null &&
        _lastBooks != null &&
        _lastRecGames != null &&
        _lastRecApps != null &&
        _lastRecBooks != null &&
        identical(games, _lastGames) &&
        identical(apps, _lastApps) &&
        identical(books, _lastBooks) &&
        identical(recG, _lastRecGames) &&
        identical(recA, _lastRecApps) &&
        identical(recB, _lastRecBooks)) {
      return;
    }

    _lastGames = games;
    _lastApps = apps;
    _lastBooks = books;
    _lastRecGames = recG;
    _lastRecApps = recA;
    _lastRecBooks = recB;

    // Если что-то поменялось пересобираем кеш
    _allProducts = [
      ...games.cast<Product>(),
      ...apps.cast<Product>(),
      ...books.cast<Product>(),
    ];
    _recommendations = [
      ...recG.cast<Product>(),
      ...recA.cast<Product>(),
      ...recB.cast<Product>(),
    ];

    notifyListeners();
  }
}
