import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_play/core/extensions/navigator_extension.dart';
import 'package:google_play/core/extensions/indexed_stack_extension.dart';
import 'package:google_play/providers/products_provider.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ValueNotifier<int> _currentPageIndex = ValueNotifier<int>(0);

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
    (_) => GlobalKey<NavigatorState>(),
  );

  final List<Widget> _screens = const [
    GamesScreen(),
    AppsScreen(),
    SearchScreen(),
    BooksScreen(),
  ];

  @override
  void dispose() {
    _currentPageIndex.dispose();
    super.dispose();
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
  void _handleTabSelection(int index) =>
      index == _currentPageIndex.value ? _popToRoot(index) : _switchTab(index);

  // Переключение на другую вкладку
  void _popToRoot(int index) =>
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);

  // Переключение вкладки
  void _switchTab(int index) => _currentPageIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageIndex,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: _screens.mapIndexed(
              (i, screen) => _navigatorKeys.createNavigator(i, screen),
            ),
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentPageIndex: currentIndex,
            onDestinationSelected: _handleTabSelection,
          ),
        );
      },
    );
  }
}
