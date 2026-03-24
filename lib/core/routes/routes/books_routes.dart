part of '../app_router.dart';

// Маршруты ветки книг
class BooksRoute extends GoRouteData with $BooksRoute {
  const BooksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BooksScreen();
}

class BooksProductRoute extends GoRouteData with $BooksProductRoute {
  final String productId;

  const BooksProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPageScreen(productId: productId);
}

class BooksAboutAuthorRoute extends GoRouteData with $BooksAboutAuthorRoute {
  final String productId;

  const BooksAboutAuthorRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AboutAuthorScreen(productId: productId);
}

class BooksCategoryRoute extends GoRouteData with $BooksCategoryRoute {
  final String categoryKey;

  const BooksCategoryRoute({required this.categoryKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CategoriesTabOverviewScreen(
        categoryKey: categoryKey,
        storeType: StoreType.books,
      );
}
