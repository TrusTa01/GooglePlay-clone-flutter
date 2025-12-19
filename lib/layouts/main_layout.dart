import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '/widgets/widgets.dart';
import '/extensions/navigator_extensions.dart';
import '/providers/products_provider.dart';

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

  Widget _buildCurrentScreen() {
    switch (_currentPageIndex) {
      case 0:
        return _navigatorKeys.createNavigator(0, const GamesScreen());
      case 1:
        return _navigatorKeys.createNavigator(1, const AppsScreen());
      case 2:
        return _navigatorKeys.createNavigator(2, const SearchScreen());
      case 3:
        return _navigatorKeys.createNavigator(3, const BooksScreen());
      default:
        return Container(); // На всякий случай
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // Проверяем, жив ли еще виджет в дереве
      if (!mounted) return;
      context.read<ProductsProvider>().loadAllProducts();
    });
  }

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
        Padding(
        padding: const EdgeInsets.only(bottom: 65), // Высота навбара, чтобы не он не перекрывал контент
        child: _buildCurrentScreen(),
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
