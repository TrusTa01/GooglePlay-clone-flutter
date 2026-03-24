part of '../app_router.dart';

// Маршруты ветки книг
class BooksRoute extends GoRouteData with $BooksRoute {
  const BooksRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BooksScreen(
    onProductTap: (productId) =>
        BooksProductRoute(productId: productId).push(context),
    onSeeAllTap: (categoryKey, titleKey) => BooksSectionMoreRoute(
      categoryKey: categoryKey,
      titleKey: titleKey,
    ).push(context),
  );
}

class BooksProductRoute extends GoRouteData with $BooksProductRoute {
  final String productId;

  const BooksProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductPageScreen(
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
        onProductTap: (productId) =>
            BooksProductRoute(productId: productId).push(context),
      );
}

class BooksSectionMoreRoute extends GoRouteData with $BooksSectionMoreRoute {
  final String categoryKey;
  final String titleKey;

  const BooksSectionMoreRoute({
    required this.categoryKey,
    required this.titleKey,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => SectionMoreScreen(
    storeType: StoreType.books,
    categoryKey: categoryKey,
    titleKey: titleKey,
    onProductTap: (productId) =>
        BooksProductRoute(productId: productId).push(context),
  );
}
