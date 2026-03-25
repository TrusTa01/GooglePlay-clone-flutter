import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/extensions/navigator_shell_ext.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomNavigationBar(
        currentPageIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.switchBranch(index),
      ),
    );
  }
}
