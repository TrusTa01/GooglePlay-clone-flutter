part of '../app_router.dart';

// Маршруты ветки приложений
class AppsRoute extends GoRouteData with $AppsRoute {
  const AppsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => AppsScreen(
    onProductTap: (productId) =>
        AppsProductRoute(productId: productId).push(context),
    onSeeAllTap: (categoryKey, title) => AppsSectionMoreRoute(
      categoryKey: categoryKey,
      title: title,
    ).push(context),
  );
}

class AppsProductRoute extends GoRouteData with $AppsProductRoute {
  final String productId;

  const AppsProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPageScreen(productType: 'app', productId: productId);
}

class AppsProductDetailsRoute extends GoRouteData
    with $AppsProductDetailsRoute {
  final String productId;

  const AppsProductDetailsRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailsScreen(
        productType: 'app',
        productId: productId,
        onPermissionsTap: () =>
            AppsProductPermissionsRoute(productId: productId).go(context),
      );
}

class AppsProductPermissionsRoute extends GoRouteData
    with $AppsProductPermissionsRoute {
  final String productId;

  const AppsProductPermissionsRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPermissionsScreen(productType: 'app', productId: productId);
}

class AppsEventRoute extends GoRouteData with $AppsEventRoute {
  final String eventId;

  const AppsEventRoute({required this.eventId});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductEventScreen(
    eventId: eventId,
    productKind: ProductKind.apps,
    onProductTap: (productId) =>
        AppsProductRoute(productId: productId).push(context),
  );
}

class AppsCategoryRoute extends GoRouteData with $AppsCategoryRoute {
  final String categoryKey;

  const AppsCategoryRoute({required this.categoryKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CategoriesTabOverviewScreen(
        categoryKey: categoryKey,
        productKind: ProductKind.apps,
        onProductTap: (productId) =>
            AppsProductRoute(productId: productId).push(context),
      );
}

class AppsSectionMoreRoute extends GoRouteData with $AppsSectionMoreRoute {
  final String categoryKey;
  final String title;

  const AppsSectionMoreRoute({required this.categoryKey, required this.title});

  @override
  Widget build(BuildContext context, GoRouterState state) => SectionMoreScreen(
    productKind: ProductKind.apps,
    categoryKey: categoryKey,
    title: title,
    onProductTap: (productId) =>
        AppsProductRoute(productId: productId).push(context),
  );
}
