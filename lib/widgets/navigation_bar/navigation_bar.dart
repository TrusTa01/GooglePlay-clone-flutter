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
      indicatorColor: Constants.navBarIndicatorColor,
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.gamepad, color: Constants.navBarDefaultLabelColor), label: 'Игры'),
        NavigationDestination(icon: Icon(Icons.apps, color: Constants.navBarDefaultLabelColor), label: 'Приложения'),
        NavigationDestination(icon: Icon(Icons.search, color: Constants.navBarDefaultLabelColor), label: 'Поиск'),
        NavigationDestination(icon: Icon(Icons.book, color: Constants.navBarDefaultLabelColor), label: 'Книги',),
      ],
    );
  }
}