import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/presentation/viewmodels/filter_provider.dart';
import 'package:google_play/core/extensions/navigator_extension.dart';
import 'package:google_play/core/extensions/indexed_stack_extension.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainLayout extends HookConsumerWidget {
  const MainLayout({super.key});

  final List<Widget> _screens = const [
    GamesScreen(),
    AppsScreen(),
    SearchScreen(),
    BooksScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = useState(Constants.defaultBottomNavIndex);
    // Список посещенных экранов: только дефолтная вкладка создаётся при старте
    final visitedPagesIndexes = useState<Set<int>>({
      Constants.defaultBottomNavIndex,
    });

    final navigatorKeys = useMemoized(
      () => List.generate(4, (_) => GlobalKey<NavigatorState>()),
      [],
    );

    bool shouldResetFilters(int fromIndex, int toIndex) {
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

    // Переключение на другую вкладку
    void popToRoot(int index) =>
        navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);

    // Переключение вкладки
    void switchTab(int index) {
      final fromIndex = currentPageIndex.value;
      if (shouldResetFilters(fromIndex, index)) {
        context.read<FilterProvider>().resetForTabIndex(index);
      }
      currentPageIndex.value = index;
      visitedPagesIndexes.value = {...visitedPagesIndexes.value, index};
    }

    // Обработчик выбора вкладки
    void handleTabSelection(int index) {
      index == currentPageIndex.value ? popToRoot(index) : switchTab(index);
      visitedPagesIndexes.value = {...visitedPagesIndexes.value, index};
    }

    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex.value,
        children: _screens.mapIndexed(
          (i, screen) => visitedPagesIndexes.value.contains(i)
              ? navigatorKeys.createNavigator(i, screen)
              : const SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentPageIndex: currentPageIndex.value,
        onDestinationSelected: handleTabSelection,
      ),
    );
  }
}
