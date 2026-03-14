import 'package:flutter/material.dart';
import 'package:google_play/presentation/screens/notifications/notifications_screen.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';
import 'package:google_play/presentation/widgets/app_bars/app_bar/tabbed_app_bar.dart';

List<Widget> buildStoreActionWidgets({
  required StoreType type,
  required BuildContext context,
}) {
  return switch (type) {
    StoreType.games || StoreType.apps => [
      IconButton(
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).push(MaterialPageRoute(builder: (context) => NotificationsScreen())),
        icon: const Icon(Icons.notifications_outlined),
      ),
      const SizedBox(width: 10),
      const CircleAvatar(radius: 18),
    ],
    StoreType.books => [
      const SizedBox(width: 25),
      const CircleAvatar(radius: 18),
    ],
  };
}

List<Widget> buildStoreAppBar({
  required StoreType type,
  required List<String> tabLabels,
  required TabController tabController,
  required List<String> tabs,
  required List<Widget> actionWidgets,
}) {
  return switch (type) {
    StoreType.games || StoreType.apps => buildSliverTabbedAppBar(
      tabs: tabLabels,
      tabController: tabController,
      actions: actionWidgets,
    ),
    StoreType.books => buildSliverTabbedAppBar(
      showLogo: false,
      hasSearch: true,
      searchHint: 'Поиск книг',
      tabs: tabs,
      tabController: tabController,
      actions: actionWidgets,
    ),
  };
}
