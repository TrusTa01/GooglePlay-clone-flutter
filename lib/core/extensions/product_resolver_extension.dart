import 'package:flutter/material.dart';
import 'package:google_play/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/providers/providers.dart';

// Общий резолвер продукта по id и доступ к объединённому списку продуктов.
/// Используется везде, где раньше был [ProductsProvider] ([getProductById], [allProducts]).
extension ProductResolverExtension on BuildContext {
  /// Ищет продукт по [id] в Games -> Apps -> Books. Возвращает первый найденный
  Product? getProductById(String id) {
    final game = read<GamesProvider>().getProductById(id);
    if (game != null) return game;
    final app = read<AppsProvider>().getProductById(id);
    if (app != null) return app;
    return read<BooksProvider>().getProductById(id);
  }

  /// Все продукты из трёх провайдеров ([games] + [apps] + [books])
  List<Product> get allProducts =>
      read<AggregatedProductsProvider>().allProducts;

  /// Все баннеры из [BannersProvider]
  List<AppBanner> get allBanners => read<BannersProvider>().banners;

  /// Объединённые рекомендации ([games] + [apps] + [books]) для сервисов, которым нужен один список
  List<Product> get recommendations =>
      read<AggregatedProductsProvider>().recommendations;

  /// Секции для экрана события по [banner]. В новой архитектуре без PageConfig пока пусто
  List<HomeSection> getEventSections(SimpleBanner banner) => [];

  // Метод, возвращающий список продуктов по типу фильтра, чтобы не дублировать логику
  /// и не тянуть в [TopCharts] лишние зависимости
  List<Product> productsForCharts(FilterType type) => switch (type) {
    FilterType.games => read<GamesProvider>().games.cast<Product>(),
    FilterType.apps => read<AppsProvider>().apps.cast<Product>(),
    FilterType.books => read<BooksProvider>().books.cast<Product>(),
    FilterType.kidsAge => [
      ...read<GamesProvider>().games.cast<Product>(),
      ...read<AppsProvider>().apps.cast<Product>(),
    ],
  };
}
