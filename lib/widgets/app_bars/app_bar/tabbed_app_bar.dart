import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/global_constants.dart';
import '../../../providers/tabs_provider.dart';
import '../../widgets.dart';

// Функция для создания SliverTabbedAppBar
// Возвращает список виджетов: верхняя часть скрывается, табы остаются закрепленными
// Используется в NestedScrollView для экранов с прокруткой и табами
List<Widget> buildSliverTabbedAppBar({
  required BuildContext context,
  required List<String> tabs,
  required TabController tabController,
  List<Widget>? actions,
  bool showLogo = true,
  bool forceElevated = false,
  // Опциональные параметры для поиска
  bool hasSearch = false,
  String? searchHint,
  List<Widget>? inputLeading,
  List<Widget>? inputActions,
  ValueChanged<String>? onSearchChanged,
}) {
  // Используем tabsProvider для получения табов
  final tabsProvider = Provider.of<TabsProvider>(context, listen: false);
  final tabsList = tabsProvider.tabs.isNotEmpty ? tabsProvider.tabs : tabs;

  return [
    // Верхняя часть AppBar - плавно сворачивается/разворачивается при прокрутке
    SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      forceElevated: forceElevated,
      expandedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      leading: null,
      automaticallyImplyLeading: false,
      title: null,
      actions: null,
      backgroundColor: AppBarConstants.defaultBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Align(
        alignment: Alignment.centerLeft,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
            // LayoutBuilder: паддинг от доступной ширины контента (а не от экрана)
            child: LayoutBuilder(
              builder: (context, constraints) {
                final padding = constraints.maxWidth > 1000
                    ? const EdgeInsets.only(left: 22)
                    : const EdgeInsets.symmetric(horizontal: 22);
                return Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      if (showLogo) const AppBarLogo(translate: Offset(6, 0)), // Костыль, потому что логотип больше чем кажется. Убрать если заменить на нормальный логотип
                      if (hasSearch)
                        Expanded(
                          child: AppBarSearchContainer(
                            inputLeading: inputLeading,
                            searchHint: searchHint ?? '',
                            inputActions: inputActions,
                          ),
                        )
                      else
                        const Spacer(),
                      if (actions != null) ...actions,
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
    // Табы - остаются закрепленными, с ограничением по sliderMaxContentWidth
    SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
            child: CustomTabBar(tabs: tabsList, controller: tabController),
          ),
        ),
      ),
    ),
  ];
}

// Делегат для SliverPersistentHeader с табами
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverTabBarDelegate({required this.child});

  @override
  double get minExtent => 48.0;

  @override
  double get maxExtent => 48.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: AppBarConstants.defaultBackgroundColor,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
