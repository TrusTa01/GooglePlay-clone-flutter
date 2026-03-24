part of '../app_router.dart';

// Маршруты ветки игр
class GamesRoute extends GoRouteData with $GamesRoute {
  const GamesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => GamesScreen(
    onProductTap: (productId) =>
        GamesProductRoute(productId: productId).push(context),
    onSeeAllTap: (categoryKey, titleKey) => GamesSectionMoreRoute(
      categoryKey: categoryKey,
      titleKey: titleKey,
    ).push(context),
  );
}

class GamesProductRoute extends GoRouteData with $GamesProductRoute {
  final String productId;

  const GamesProductRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPageScreen(productId: productId);
}

class GamesProductDetailsRoute extends GoRouteData
    with $GamesProductDetailsRoute {
  final String productId;

  const GamesProductDetailsRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailsScreen(
        productId: productId,
        onPermissionsTap: () =>
            GamesProductPermissionsRoute(productId: productId).go(context),
      );
}

class GamesProductPermissionsRoute extends GoRouteData
    with $GamesProductPermissionsRoute {
  final String productId;

  const GamesProductPermissionsRoute({required this.productId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductPermissionsScreen(productId: productId);
}

class GamesEventRoute extends GoRouteData with $GamesEventRoute {
  final String eventId;

  const GamesEventRoute({required this.eventId});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductEventScreen(
    eventId: eventId,
    storeType: StoreType.games,
    onProductTap: (productId) =>
        GamesProductRoute(productId: productId).push(context),
  );
}

class GamesCategoryRoute extends GoRouteData with $GamesCategoryRoute {
  final String categoryKey;

  const GamesCategoryRoute({required this.categoryKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CategoriesTabOverviewScreen(
        categoryKey: categoryKey,
        storeType: StoreType.games,
        onProductTap: (productId) =>
            GamesProductRoute(productId: productId).push(context),
      );
}

class GamesKidsDetailsRoute extends GoRouteData with $GamesKidsDetailsRoute {
  const GamesKidsDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const KidsDetailsScreen();
}

class GamesKidsAgeCategoryRoute extends GoRouteData
    with $GamesKidsAgeCategoryRoute {
  final String ageKey;

  const GamesKidsAgeCategoryRoute({required this.ageKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      KidsAgeCategoryScreen(ageKey: ageKey);
}

class GamesKidsAgeDetailsRoute extends GoRouteData
    with $GamesKidsAgeDetailsRoute {
  final String ageKey;

  const GamesKidsAgeDetailsRoute({required this.ageKey});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const KidsDetailsScreen();
}

class GamesSectionMoreRoute extends GoRouteData with $GamesSectionMoreRoute {
  final String categoryKey;
  final String titleKey;

  const GamesSectionMoreRoute({
    required this.categoryKey,
    required this.titleKey,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => SectionMoreScreen(
    storeType: StoreType.games,
    categoryKey: categoryKey,
    titleKey: titleKey,
    onProductTap: (productId) =>
        GamesProductRoute(productId: productId).push(context),
  );
}
