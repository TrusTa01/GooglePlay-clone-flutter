import 'package:flutter/material.dart';
import 'package:google_play/core/constants/global_constants.dart';
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
  final ValueNotifier<int> _currentPageIndex =
      ValueNotifier<int>(Constants.defaultBottomNavIndex);
  // Список посещенных экранов: только дефолтная вкладка создаётся при старте
  final ValueNotifier<Set<int>> _visitedPagesIndexes = ValueNotifier<Set<int>>({
    Constants.defaultBottomNavIndex,
  });

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
    _visitedPagesIndexes.dispose();
    super.dispose();
  }

  // Обработчик выбора вкладки
  void _handleTabSelection(int index) {
    index == _currentPageIndex.value ? _popToRoot(index) : _switchTab(index);
    _visitedPagesIndexes.value = {..._visitedPagesIndexes.value, index};
  }

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
    _visitedPagesIndexes.value = {..._visitedPagesIndexes.value, index};
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
    return AnimatedBuilder(
      animation: Listenable.merge([_currentPageIndex, _visitedPagesIndexes]),
      builder: (context, _) {
        return Scaffold(
          body: IndexedStack(
            index: _currentPageIndex.value,
            children: _screens.mapIndexed(
              (i, screen) => _visitedPagesIndexes.value.contains(i)
                  ? _navigatorKeys.createNavigator(i, screen)
                  : const SizedBox.shrink(),
            ),
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentPageIndex: _currentPageIndex.value,
            onDestinationSelected: _handleTabSelection,
          ),
        );
      },
    );
  }
}
