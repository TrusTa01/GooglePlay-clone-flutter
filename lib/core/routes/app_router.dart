import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/routes/app_routes_names.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/layouts/main_layout.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/full_screen_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.g.dart';
part 'routes/common_routes.dart';
part 'routes/games_routes.dart';
part 'routes/apps_routes.dart';
part 'routes/search_routes.dart';
part 'routes/books_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// Провайдер роутера
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Constants.initialLocation,
    navigatorKey: _rootNavigatorKey,
    routes: $appRoutes,
  );
});

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    // Ветка игр
    TypedStatefulShellBranch<GamesBranchData>(
      routes: [
        TypedGoRoute<GamesRoute>(
          path: AppRouterNames.games,
          routes: [
            TypedGoRoute<GamesProductRoute>(
              path: AppRouterNames.productScreen,
              routes: [
                TypedGoRoute<GamesProductDetailsRoute>(
                  path: AppRouterNames.productDetails,
                  routes: [
                    TypedGoRoute<GamesProductPermissionsRoute>(
                      path: AppRouterNames.productPermissions,
                    ),
                  ],
                ),
              ],
            ),
            TypedGoRoute<GamesEventRoute>(path: AppRouterNames.eventsScreen),
            TypedGoRoute<GamesCategoryRoute>(
              path: AppRouterNames.categoriesOverview,
            ),
            TypedGoRoute<GamesKidsDetailsRoute>(
              path: AppRouterNames.kidsDetailsScreen,
            ),
            TypedGoRoute<GamesKidsAgeCategoryRoute>(
              path: AppRouterNames.kidsAgeCategoryScreen,
              routes: [
                TypedGoRoute<GamesKidsAgeDetailsRoute>(
                  path: AppRouterNames.kidsDetailsScreen,
                ),
              ],
            ),
            TypedGoRoute<GamesSectionMoreRoute>(
              path: AppRouterNames.sectionMore,
            ),
          ],
        ),
      ],
    ),

    // Ветка приложений
    TypedStatefulShellBranch<AppsBranchData>(
      routes: [
        TypedGoRoute<AppsRoute>(
          path: AppRouterNames.apps,
          routes: [
            TypedGoRoute<AppsProductRoute>(
              path: AppRouterNames.productScreen,
              routes: [
                TypedGoRoute<AppsProductDetailsRoute>(
                  path: AppRouterNames.productDetails,
                  routes: [
                    TypedGoRoute<AppsProductPermissionsRoute>(
                      path: AppRouterNames.productPermissions,
                    ),
                  ],
                ),
              ],
            ),
            TypedGoRoute<AppsEventRoute>(path: AppRouterNames.eventsScreen),
            TypedGoRoute<AppsCategoryRoute>(
              path: AppRouterNames.categoriesOverview,
            ),
            TypedGoRoute<AppsSectionMoreRoute>(
              path: AppRouterNames.sectionMore,
            ),
          ],
        ),
      ],
    ),

    // Ветка поиска
    TypedStatefulShellBranch<SearchBranchData>(
      routes: [TypedGoRoute<SearchRoute>(path: AppRouterNames.search)],
    ),

    // Ветка книг
    TypedStatefulShellBranch<BooksBranchData>(
      routes: [
        TypedGoRoute<BooksRoute>(
          path: AppRouterNames.books,
          routes: [
            TypedGoRoute<BooksProductRoute>(
              path: AppRouterNames.productScreen,
              routes: [
                TypedGoRoute<BooksAboutAuthorRoute>(
                  path: AppRouterNames.productAboutAuthor,
                ),
              ],
            ),
            TypedGoRoute<BooksCategoryRoute>(
              path: AppRouterNames.categoriesOverview,
            ),
            TypedGoRoute<BooksSectionMoreRoute>(
              path: AppRouterNames.sectionMore,
            ),
          ],
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainLayout(navigationShell: navigationShell);
  }
}
