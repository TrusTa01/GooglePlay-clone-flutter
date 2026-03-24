part of '../app_router.dart';

// Маршруты ветки поиска
class SearchRoute extends GoRouteData with $SearchRoute {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SearchScreen();
}
