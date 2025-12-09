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
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      indicatorColor: NavBarConstants.navBarIndicatorColor,
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.gamepad, color: NavBarConstants.navBarDefaultLabelColor), label: 'Игры'),
        NavigationDestination(icon: Icon(Icons.apps, color: NavBarConstants.navBarDefaultLabelColor), label: 'Приложения'),
        NavigationDestination(icon: Icon(Icons.search, color: NavBarConstants.navBarDefaultLabelColor), label: 'Поиск'),
        NavigationDestination(icon: Icon(Icons.book, color: NavBarConstants.navBarDefaultLabelColor), label: 'Книги',),
      ],
    );
  }
}