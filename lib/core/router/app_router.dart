import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/layouts/main_layout.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/full_screen_image.dart';
import 'package:google_play/presentation/viewmodels/events/product_event_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract final class AppRoutes {
  // Общие
  static const String games = '/games';
  static const String apps = '/apps';
  static const String search = '/search';
  static const String books = '/books';
  // Скриншоты
  static const String image = 'image';

  // Экраны продукта
  static const String productScreen = 'product/:productId';
  static const String productDetails = 'details';
  static const String productPermissions = 'permissions';

  // События (банера)
  static const String eventsScreen = 'events';

  // Категории
  static const String categoriesOverview = 'category/:categoryKey';

  // Детям
  static const String kidsDetailsScreen = 'kids/info';
  static const String kidsAgeCategoryScreen = 'kids/:ageKey';
}

// Глобальные ключи навигации
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorGamesKey = GlobalKey<NavigatorState>(debugLabel: 'games');
final _shellNavigatorAppsKey = GlobalKey<NavigatorState>(debugLabel: 'apps');
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>(
  debugLabel: 'search',
);
final _shellNavigatorBooksKey = GlobalKey<NavigatorState>(debugLabel: 'books');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Constants.initialLocation,
    navigatorKey: _rootNavigatorKey,
    routes: [
      // Общие маршруты
      GoRoute(
        path: AppRoutes.image,
        builder: (context, state) {
          final args = state.extra as Map<String, String>;
          return FullScreenImage(
            imageUrl: args['imageUrl']!,
            heroTag: args['heroTag']!,
          );
        },
      ),

      // Ветки всех вкладок
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainLayout(navigationShell: navigationShell),
        branches: [
          // Ветка игр
          StatefulShellBranch(
            navigatorKey: _shellNavigatorGamesKey,
            routes: [
              GoRoute(
                path: AppRoutes.games,
                builder: (context, state) => const GamesScreen(),
                routes: [
                  // Ветка экрана продукта
                  GoRoute(
                    path: AppRoutes.productScreen,
                    builder: (context, state) {
                      final productId = state.pathParameters['productId']!;
                      return ProductPageScreen(productId: productId);
                    },
                    routes: [
                      GoRoute(
                        path: AppRoutes.productDetails,
                        builder: (context, state) {
                          final productId = state.pathParameters['productId']!;
                          return ProductDetailsScreen(productId: productId);
                        },
                        routes: [
                          GoRoute(
                            path: AppRoutes.productPermissions,
                            builder: (context, state) {
                              final productId =
                                  state.pathParameters['productId']!;
                              return ProductPermissionsScreen(
                                productId: productId,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  // events
                  GoRoute(
                    path: AppRoutes.eventsScreen,
                    builder: (context, state) {
                      final extra = state.extra;
                      if (extra is! ProductEventArgs) {
                        return const Scaffold(
                          body: Center(
                            child: Text('Invalid navigation args for events'),
                          ),
                        );
                      }

                      return ProductEventScreen(args: extra);
                    },
                  ),

                  // category
                  GoRoute(
                    path: AppRoutes.categoriesOverview,
                    builder: (context, state) {
                      final categoryKey = state.pathParameters['categoryKey']!;
                      return CategoriesTabOverviewScreen(
                        categoryKey: categoryKey,
                        storeType: StoreType.games,
                      );
                    },
                  ),

                  // kids
                  GoRoute(
                    path: AppRoutes.kidsDetailsScreen,
                    builder: (context, state) => const KidsDetailsScreen(),
                  ),

                  GoRoute(
                    path: AppRoutes.kidsAgeCategoryScreen,
                    builder: (context, state) {
                      final ageKey = state.pathParameters['ageKey']!;
                      return KidsAgeCategoryScreen(ageKey: ageKey);
                    },
                    routes: [
                      GoRoute(
                        path: AppRoutes.kidsDetailsScreen,
                        builder: (context, state) => const KidsDetailsScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Ветка приложений
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppsKey,
            routes: [
              GoRoute(
                path: AppRoutes.apps,
                builder: (context, state) => const AppsScreen(),
              ),
            ],
          ),

          // Ветка поиска
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSearchKey,
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),

          // Ветка книг
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBooksKey,
            routes: [
              GoRoute(
                path: AppRoutes.books,
                builder: (context, state) => const BooksScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
