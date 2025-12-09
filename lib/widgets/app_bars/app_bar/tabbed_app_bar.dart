import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_play/providers/tabs_provider.dart';
import 'package:google_play/widgets/widgets.dart';

class TabbedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final List<String> tabs;
  final TabController? tabController;
  final Color? backgroundColor;
  final bool showLogo;
  final String logoAssetPath;

  const TabbedAppBar({
    super.key,
    this.actions,
    required this.tabs,
    this.tabController,
    this.backgroundColor,
    this.showLogo = true,
    this.logoAssetPath = 'assets/images/google_play_logo.png',
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight + 48);
  }

  @override
  State<TabbedAppBar> createState() => TabbedAppBarState();
}

class TabbedAppBarState extends State<TabbedAppBar> {
  

  @override
  Widget build(BuildContext context) {
    final tabsProvider = Provider.of<TabsProvider>(context);
    final tabs = tabsProvider.tabs;

    return AppBar(
      leading: widget.showLogo ? AppBarUtils.buildLogo(logoAssetPath: widget.logoAssetPath) : null,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      elevation: 0,
      bottom: CustomTabBar(
        tabs: tabs,
        controller: widget.tabController!,
      ),
      actions: widget.actions,
    );
  }
}
