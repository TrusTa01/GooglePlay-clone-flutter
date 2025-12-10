import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: buildCustomNavigationBarTheme(),
        ),
      child: NavigationBar(
        height: 65,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: NavBarConstants.navBarIndicatorColor,
        selectedIndex: currentPageIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor: NavBarConstants.navBarBackgroungColor,
        destinations: destinations,
      ),
      ),
    );
  }
}
