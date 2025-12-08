import 'package:flutter/material.dart';

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
      indicatorColor: Colors.blue[200],
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <Widget>[
        NavigationDestination(icon: Icon(Icons.gamepad), label: 'Игры'),
        NavigationDestination(icon: Icon(Icons.apps), label: 'Приложения'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Поиск'),
        NavigationDestination(icon: Icon(Icons.book), label: 'Книги'),
      ],
    );
  }
}