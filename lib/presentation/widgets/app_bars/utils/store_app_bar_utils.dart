import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
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
  required BuildContext context,
  required StoreType type,
  required List<String> tabLabelKeys,
  required TabController tabController,
  required List<String> tabs,
  required List<Widget> actionWidgets,
}) {
  // Разрешаем ключи табов в локализованные строки.
  List<String> resolveTabLabels() {
    final l10n = context.l10n;
    return tabLabelKeys.map((key) {
      switch (key) {
        case 'tabRecommended':
          return l10n.tabRecommended;
        case 'tabTopCharts':
          return l10n.tabTopCharts;
        case 'tabKids':
          return l10n.tabKids;
        case 'tabPaid':
          return l10n.tabPaid;
        case 'tabCategories':
          return l10n.tabCategories;
        default:
          return key;
      }
    }).toList();
  }

  final localizedTabs = resolveTabLabels();

  return switch (type) {
    StoreType.games || StoreType.apps => buildSliverTabbedAppBar(
        tabs: localizedTabs,
        tabController: tabController,
        actions: actionWidgets,
      ),
    StoreType.books => buildSliverTabbedAppBar(
        showLogo: false,
        hasSearch: true,
        searchHint: context.l10n.searchBooksHint,
        tabs: localizedTabs,
        tabController: tabController,
        actions: actionWidgets,
      ),
  };
}
