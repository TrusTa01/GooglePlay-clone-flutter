import 'package:go_router/go_router.dart';

extension NavigatorShellExt on StatefulNavigationShell {
  void switchBranch(int index) =>
      goBranch(index, initialLocation: index == currentIndex);
}
