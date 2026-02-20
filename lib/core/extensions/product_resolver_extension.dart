import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/providers/providers.dart';

/// Общий резолвер продукта по id и доступ к объединённому списку продуктов.
/// Используется везде, где раньше был ProductsProvider (getProductById, allProducts).
extension ProductResolverExtension on BuildContext {
  /// Ищет продукт по [id] в Games → Apps → Books. Возвращает первый найденный.
  Product? getProductById(String id) {
    final game = read<GamesProvider>().getProductById(id);
    if (game != null) return game;
    final app = read<AppsProvider>().getProductById(id);
    if (app != null) return app;
    return read<BooksProvider>().getProductById(id);
  }

  /// Все продукты из трёх провайдеров (games + apps + books).
  List<Product> get allProducts {
    final games = read<GamesProvider>().games.cast<Product>();
    final apps = read<AppsProvider>().apps.cast<Product>();
    final books = read<BooksProvider>().books.cast<Product>();
    return [...games, ...apps, ...books];
  }

  /// Все баннеры (из BannersProvider).
  List<AppBanner> get allBanners => read<BannersProvider>().banners;

  /// Объединённые рекомендации (games + apps + books) для сервисов, которым нужен один список.
  List<Product> get recommendations {
    final g = read<GamesProvider>().recommendations.cast<Product>();
    final a = read<AppsProvider>().recommendations.cast<Product>();
    final b = read<BooksProvider>().recommendations.cast<Product>();
    return [...g, ...a, ...b];
  }

  /// Секции для экрана события по [banner]. В новой архитектуре без PageConfig пока пусто.
  List<HomeSection> getEventSections(SimpleBanner banner) => [];
}
