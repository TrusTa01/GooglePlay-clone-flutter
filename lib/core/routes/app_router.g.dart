// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainShellRouteData, $imageRoute];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/games',
          factory: $GamesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'product/:productId',
              factory: $GamesProductRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'details',
                  factory: $GamesProductDetailsRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'permissions',
                      factory: $GamesProductPermissionsRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'events',
              factory: $GamesEventRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'category/:categoryKey',
              factory: $GamesCategoryRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'kids/info',
              factory: $GamesKidsDetailsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'kids/:ageKey',
              factory: $GamesKidsAgeCategoryRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'kids/info',
                  factory: $GamesKidsAgeDetailsRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'section/:categoryKey',
              factory: $GamesSectionMoreRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/apps',
          factory: $AppsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'product/:productId',
              factory: $AppsProductRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'details',
                  factory: $AppsProductDetailsRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'permissions',
                      factory: $AppsProductPermissionsRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'events',
              factory: $AppsEventRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'category/:categoryKey',
              factory: $AppsCategoryRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'section/:categoryKey',
              factory: $AppsSectionMoreRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/search', factory: $SearchRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/books',
          factory: $BooksRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'product/:productId',
              factory: $BooksProductRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'author',
                  factory: $BooksAboutAuthorRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'category/:categoryKey',
              factory: $BooksCategoryRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'section/:categoryKey',
              factory: $BooksSectionMoreRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin $GamesRoute on GoRouteData {
  static GamesRoute _fromState(GoRouterState state) => const GamesRoute();

  @override
  String get location => GoRouteData.$location('/games');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesProductRoute on GoRouteData {
  static GamesProductRoute _fromState(GoRouterState state) =>
      GamesProductRoute(productId: state.pathParameters['productId']!);

  GamesProductRoute get _self => this as GamesProductRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/product/${Uri.encodeComponent(_self.productId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesProductDetailsRoute on GoRouteData {
  static GamesProductDetailsRoute _fromState(GoRouterState state) =>
      GamesProductDetailsRoute(productId: state.pathParameters['productId']!);

  GamesProductDetailsRoute get _self => this as GamesProductDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/product/${Uri.encodeComponent(_self.productId)}/details',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesProductPermissionsRoute on GoRouteData {
  static GamesProductPermissionsRoute _fromState(GoRouterState state) =>
      GamesProductPermissionsRoute(
        productId: state.pathParameters['productId']!,
      );

  GamesProductPermissionsRoute get _self =>
      this as GamesProductPermissionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/product/${Uri.encodeComponent(_self.productId)}/details/permissions',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesEventRoute on GoRouteData {
  static GamesEventRoute _fromState(GoRouterState state) =>
      GamesEventRoute(eventId: state.uri.queryParameters['event-id']!);

  GamesEventRoute get _self => this as GamesEventRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/events',
    queryParams: {'event-id': _self.eventId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesCategoryRoute on GoRouteData {
  static GamesCategoryRoute _fromState(GoRouterState state) =>
      GamesCategoryRoute(categoryKey: state.pathParameters['categoryKey']!);

  GamesCategoryRoute get _self => this as GamesCategoryRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/category/${Uri.encodeComponent(_self.categoryKey)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesKidsDetailsRoute on GoRouteData {
  static GamesKidsDetailsRoute _fromState(GoRouterState state) =>
      const GamesKidsDetailsRoute();

  @override
  String get location => GoRouteData.$location('/games/kids/info');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesKidsAgeCategoryRoute on GoRouteData {
  static GamesKidsAgeCategoryRoute _fromState(GoRouterState state) =>
      GamesKidsAgeCategoryRoute(ageKey: state.pathParameters['ageKey']!);

  GamesKidsAgeCategoryRoute get _self => this as GamesKidsAgeCategoryRoute;

  @override
  String get location =>
      GoRouteData.$location('/games/kids/${Uri.encodeComponent(_self.ageKey)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesKidsAgeDetailsRoute on GoRouteData {
  static GamesKidsAgeDetailsRoute _fromState(GoRouterState state) =>
      GamesKidsAgeDetailsRoute(ageKey: state.pathParameters['ageKey']!);

  GamesKidsAgeDetailsRoute get _self => this as GamesKidsAgeDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/kids/${Uri.encodeComponent(_self.ageKey)}/kids/info',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GamesSectionMoreRoute on GoRouteData {
  static GamesSectionMoreRoute _fromState(GoRouterState state) =>
      GamesSectionMoreRoute(
        categoryKey: state.pathParameters['categoryKey']!,
        titleKey: state.uri.queryParameters['title-key']!,
      );

  GamesSectionMoreRoute get _self => this as GamesSectionMoreRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/section/${Uri.encodeComponent(_self.categoryKey)}',
    queryParams: {'title-key': _self.titleKey},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsRoute on GoRouteData {
  static AppsRoute _fromState(GoRouterState state) => const AppsRoute();

  @override
  String get location => GoRouteData.$location('/apps');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsProductRoute on GoRouteData {
  static AppsProductRoute _fromState(GoRouterState state) =>
      AppsProductRoute(productId: state.pathParameters['productId']!);

  AppsProductRoute get _self => this as AppsProductRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/product/${Uri.encodeComponent(_self.productId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsProductDetailsRoute on GoRouteData {
  static AppsProductDetailsRoute _fromState(GoRouterState state) =>
      AppsProductDetailsRoute(productId: state.pathParameters['productId']!);

  AppsProductDetailsRoute get _self => this as AppsProductDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/product/${Uri.encodeComponent(_self.productId)}/details',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsProductPermissionsRoute on GoRouteData {
  static AppsProductPermissionsRoute _fromState(GoRouterState state) =>
      AppsProductPermissionsRoute(
        productId: state.pathParameters['productId']!,
      );

  AppsProductPermissionsRoute get _self => this as AppsProductPermissionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/product/${Uri.encodeComponent(_self.productId)}/details/permissions',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsEventRoute on GoRouteData {
  static AppsEventRoute _fromState(GoRouterState state) =>
      AppsEventRoute(eventId: state.uri.queryParameters['event-id']!);

  AppsEventRoute get _self => this as AppsEventRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/events',
    queryParams: {'event-id': _self.eventId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsCategoryRoute on GoRouteData {
  static AppsCategoryRoute _fromState(GoRouterState state) =>
      AppsCategoryRoute(categoryKey: state.pathParameters['categoryKey']!);

  AppsCategoryRoute get _self => this as AppsCategoryRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/category/${Uri.encodeComponent(_self.categoryKey)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppsSectionMoreRoute on GoRouteData {
  static AppsSectionMoreRoute _fromState(GoRouterState state) =>
      AppsSectionMoreRoute(
        categoryKey: state.pathParameters['categoryKey']!,
        titleKey: state.uri.queryParameters['title-key']!,
      );

  AppsSectionMoreRoute get _self => this as AppsSectionMoreRoute;

  @override
  String get location => GoRouteData.$location(
    '/apps/section/${Uri.encodeComponent(_self.categoryKey)}',
    queryParams: {'title-key': _self.titleKey},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  @override
  String get location => GoRouteData.$location('/search');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BooksRoute on GoRouteData {
  static BooksRoute _fromState(GoRouterState state) => const BooksRoute();

  @override
  String get location => GoRouteData.$location('/books');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BooksProductRoute on GoRouteData {
  static BooksProductRoute _fromState(GoRouterState state) =>
      BooksProductRoute(productId: state.pathParameters['productId']!);

  BooksProductRoute get _self => this as BooksProductRoute;

  @override
  String get location => GoRouteData.$location(
    '/books/product/${Uri.encodeComponent(_self.productId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BooksAboutAuthorRoute on GoRouteData {
  static BooksAboutAuthorRoute _fromState(GoRouterState state) =>
      BooksAboutAuthorRoute(productId: state.pathParameters['productId']!);

  BooksAboutAuthorRoute get _self => this as BooksAboutAuthorRoute;

  @override
  String get location => GoRouteData.$location(
    '/books/product/${Uri.encodeComponent(_self.productId)}/author',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BooksCategoryRoute on GoRouteData {
  static BooksCategoryRoute _fromState(GoRouterState state) =>
      BooksCategoryRoute(categoryKey: state.pathParameters['categoryKey']!);

  BooksCategoryRoute get _self => this as BooksCategoryRoute;

  @override
  String get location => GoRouteData.$location(
    '/books/category/${Uri.encodeComponent(_self.categoryKey)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BooksSectionMoreRoute on GoRouteData {
  static BooksSectionMoreRoute _fromState(GoRouterState state) =>
      BooksSectionMoreRoute(
        categoryKey: state.pathParameters['categoryKey']!,
        titleKey: state.uri.queryParameters['title-key']!,
      );

  BooksSectionMoreRoute get _self => this as BooksSectionMoreRoute;

  @override
  String get location => GoRouteData.$location(
    '/books/section/${Uri.encodeComponent(_self.categoryKey)}',
    queryParams: {'title-key': _self.titleKey},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $imageRoute => GoRouteData.$route(
  path: '/image',
  parentNavigatorKey: ImageRoute.$parentNavigatorKey,
  factory: $ImageRoute._fromState,
);

mixin $ImageRoute on GoRouteData {
  static ImageRoute _fromState(GoRouterState state) => ImageRoute(
    imageUrl: state.uri.queryParameters['image-url']!,
    heroTag: state.uri.queryParameters['hero-tag']!,
  );

  ImageRoute get _self => this as ImageRoute;

  @override
  String get location => GoRouteData.$location(
    '/image',
    queryParams: {'image-url': _self.imageUrl, 'hero-tag': _self.heroTag},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
