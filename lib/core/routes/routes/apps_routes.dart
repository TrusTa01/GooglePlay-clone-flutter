part of '../app_router.dart';

// Маршруты ветки приложений
class AppsRoute extends GoRouteData with $AppsRoute {
  const AppsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => AppsScreen(
    onProductTap: (productId) =>
        AppsProductRoute(productId: productId).push(context),
    onSeeAllTap: (categoryKey, titleKey) => AppsSectionMoreRoute(
      categoryKey: categoryKey,
      titleKey: titleKey,
    ).push(context),
  );
}

class AppsProductRoute extends GoRouteData with $AppsProductRoute {
  final String productId;

  const AppsProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPageScreen(productId: productId);
}

class AppsProductDetailsRoute extends GoRouteData
    with $AppsProductDetailsRoute {
  final String productId;

  const AppsProductDetailsRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailsScreen(
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
      ProductPermissionsScreen(productId: productId);
}

class AppsEventRoute extends GoRouteData with $AppsEventRoute {
  final String eventId;

  const AppsEventRoute({required this.eventId});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductEventScreen(
    eventId: eventId,
    storeType: StoreType.apps,
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
        storeType: StoreType.apps,
        onProductTap: (productId) =>
            AppsProductRoute(productId: productId).push(context),
      );
}

class AppsSectionMoreRoute extends GoRouteData with $AppsSectionMoreRoute {
  final String categoryKey;
  final String titleKey;

  const AppsSectionMoreRoute({
    required this.categoryKey,
    required this.titleKey,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => SectionMoreScreen(
    storeType: StoreType.apps,
    categoryKey: categoryKey,
    titleKey: titleKey,
    onProductTap: (productId) =>
        AppsProductRoute(productId: productId).push(context),
  );
}
