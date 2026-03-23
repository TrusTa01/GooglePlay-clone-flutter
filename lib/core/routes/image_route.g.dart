// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$imageRoute];

RouteBase get $imageRoute =>
    GoRouteData.$route(path: '/image', factory: $ImageRoute._fromState);

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
