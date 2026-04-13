part of '../app_router.dart';

// Маршруты ветки книг
class BooksRoute extends GoRouteData with $BooksRoute {
  const BooksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BooksScreen(
    onProductTap: (productId) =>
        BooksProductRoute(productId: productId).push(context),
    onSeeAllTap: (categoryKey, title) => BooksSectionMoreRoute(
      categoryKey: categoryKey,
      title: title,
    ).push(context),
  );
}

class BooksProductRoute extends GoRouteData with $BooksProductRoute {
  final String productId;

  const BooksProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductPageScreen(
    productType: 'book',
    productId: productId,
    onAboutAuthorTap: () =>
        BooksAboutAuthorRoute(productId: productId).go(context),
  );
}

class BooksAboutAuthorRoute extends GoRouteData with $BooksAboutAuthorRoute {
  final String productId;

  const BooksAboutAuthorRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AboutAuthorScreen(productType: 'book', productId: productId);
}

class BooksCategoryRoute extends GoRouteData with $BooksCategoryRoute {
  final String categoryKey;

  const BooksCategoryRoute({required this.categoryKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CategoriesTabOverviewScreen(
        categoryKey: categoryKey,
        productKind: ProductKind.books,
        onProductTap: (productId) =>
            BooksProductRoute(productId: productId).push(context),
      );
}

class BooksSectionMoreRoute extends GoRouteData with $BooksSectionMoreRoute {
  final String categoryKey;
  final String title;

  const BooksSectionMoreRoute({
    required this.categoryKey,
    required this.title,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => SectionMoreScreen(
    productKind: ProductKind.books,
    categoryKey: categoryKey,
    title: title,
    onProductTap: (productId) =>
        BooksProductRoute(productId: productId).push(context),
  );
}
