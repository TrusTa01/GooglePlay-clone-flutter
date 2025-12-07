import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../widgets/widgets.dart';
import '../extensions/navigator_extensions.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentPageIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(), // Games
    GlobalKey<NavigatorState>(), // Apps
    GlobalKey<NavigatorState>(), // Search
    GlobalKey<NavigatorState>(), // Books
  ];

  // Обработчик выбора вкладки
  void _handleTabSelection(int index) {
    if (index == _currentPageIndex) {
      _popToRoot(index);
    } else {
      _switchTab(index);
    }
  }

  // Переключение на другую вкладку
  void _popToRoot(int index) {
    _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
  }

  // Переключение вкладки
  void _switchTab(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Контент с отступом
        // Positioned.fill(
        //   bottom: 56 + MediaQuery.of(context).padding.bottom,
          // IndexedStack с Navigator'ами
          IndexedStack(
            index: _currentPageIndex,
            children: [
              _navigatorKeys.createNavigator(0, const GamesScreen()),
              _navigatorKeys.createNavigator(1, const AppsScreen()),
              _navigatorKeys.createNavigator(2, const SearchScreen()),
              _navigatorKeys.createNavigator(3, const BooksScreen()),
            ],
          ),
        // CustomNavigationBar поверх всего
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomNavigationBar(
            currentPageIndex: _currentPageIndex,
            onDestinationSelected: _handleTabSelection,
          ),
        ),
      ],
    );
  }
}
