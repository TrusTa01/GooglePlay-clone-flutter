import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      leading: showLogo ? AppBarLogo() : null,
      backgroundColor: AppBarConstants.defaultBackgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: hasSearch
          ? AppBarSearchContainer(
              inputLeading: inputLeading,
              searchHint: searchHint ?? '',
              inputActions: inputActions,
            )
          : null,
      actions: actions,
    ),
    // Табы - остаются закрепленными
    SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(
        child: CustomTabBar(tabs: tabsList, controller: tabController),
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
    return child;
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
