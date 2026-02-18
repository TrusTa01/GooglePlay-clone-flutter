import 'package:flutter/material.dart';
import 'package:google_play/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_play/core/extensions/navigator_extension.dart';
import 'package:google_play/core/extensions/indexed_stack_extension.dart';
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

  // Обработчик выбора вкладки
  void _handleTabSelection(int index) =>
      index == _currentPageIndex.value ? _popToRoot(index) : _switchTab(index);

  // Переключение на другую вкладку
  void _popToRoot(int index) =>
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);

  // Переключение вкладки
  void _switchTab(int index) {
    final fromIndex = _currentPageIndex.value;
    if (_shouldResetFilters(fromIndex, index)) {
      context.read<FilterProvider>().resetForTabIndex(index);
    }
    _currentPageIndex.value = index;
    setState(() {});
  }

  bool _shouldResetFilters(int fromIndex, int toIndex) {
    // Не сбрасываем если останемся на той же вкладке
    if (fromIndex == toIndex) return false;

    // Сбрасываем при переходе между любыми главными вкладками
    // Games (0) <-> Apps (1) <-> Books (3)
    // Search (2) Не имеет фильтров, игнорируем
    final contentTabs = [0, 1, 3]; // Games, Apps, Books

    final fromIsContent = contentTabs.contains(fromIndex);
    final toIsContent = contentTabs.contains(toIndex);

    return fromIsContent && toIsContent;
  }

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
