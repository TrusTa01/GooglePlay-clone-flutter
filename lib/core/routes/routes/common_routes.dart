part of '../app_router.dart';

@TypedGoRoute<ImageRoute>(path: AppRouterNames.image)
class ImageRoute extends GoRouteData with $ImageRoute {
  final String imageUrl;
  final String heroTag;

  const ImageRoute({required this.imageUrl, required this.heroTag});

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FullScreenImage(imageUrl: imageUrl, heroTag: heroTag);
  }
}

// Данные веток
class GamesBranchData extends StatefulShellBranchData {
  const GamesBranchData();
}

class AppsBranchData extends StatefulShellBranchData {
  const AppsBranchData();
}

class SearchBranchData extends StatefulShellBranchData {
  const SearchBranchData();
}

class BooksBranchData extends StatefulShellBranchData {
  const BooksBranchData();
}
