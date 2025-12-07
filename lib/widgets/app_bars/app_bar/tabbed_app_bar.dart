import 'package:flutter/material.dart';

import '../shared/app_bar_utils.dart';

class TabbedAppBar extends StatelessWidget implements PreferredSizeWidget{
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
    return const Size.fromHeight(kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showLogo ? AppBarUtils.buildLogo(logoAssetPath: logoAssetPath) : null,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      bottom: TabBar(
        controller: tabController,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        isScrollable: false,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[800],
        indicatorColor: const Color(0xFF4285F4),
        indicatorWeight: 3.0,      
      ),
      actions: actions,
    );
  }
}
