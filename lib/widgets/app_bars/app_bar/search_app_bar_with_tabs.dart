import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_play/providers/tabs_provider.dart';
import 'package:google_play/widgets/widgets.dart';

interface class SearchAppBarWithTabs extends StatefulWidget
    implements PreferredSizeWidget {
  final String searchHint;
  final List<Widget>? inputLeading;
  final List<Widget>? inputActions;
  final ValueChanged<String>? onSearchChanged;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final List<String> tabs;
  final TabController? tabController;

  const SearchAppBarWithTabs({
    super.key,
    required this.searchHint,
    this.inputLeading,
    this.inputActions,
    this.onSearchChanged,
    this.actions,
    this.backgroundColor,
    required this.tabs,
    this.tabController,
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 48);
  }

  @override
  State<SearchAppBarWithTabs> createState() => _SearchAppBarWithTabsState();
}

class _SearchAppBarWithTabsState extends State<SearchAppBarWithTabs> {
  @override
  Widget build(BuildContext context) {
    final tabsProvider = Provider.of<TabsProvider>(context);
    final tabs = tabsProvider.tabs;

    return AppBar(
      backgroundColor: AppBarConstants.defaultBackgroundColor,
      elevation: AppBarConstants.defaultElevation,
      title: AppBarUtils.buildSearchContainer(
        inputLeading: widget.inputLeading,
        searchHint: widget.searchHint,
        inputActions: widget.inputActions,
      ),
      bottom: CustomTabBar(tabs: tabs, controller: widget.tabController!),
      actions: widget.actions,
    );
  }
}
