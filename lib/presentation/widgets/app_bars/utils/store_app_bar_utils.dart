import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/domain/entities/store/store_type.dart';
import 'package:google_play/presentation/widgets/app_bars/app_bar/tabbed_app_bar.dart';
import 'package:google_play/presentation/widgets/popup_menu/language_popup_menu.dart';

List<Widget> buildStoreActionWidgets({
  required StoreType type,
  required BuildContext context,
}) {
  return const [
    LanguagePopupMenu(),
    SizedBox(width: 10),
    CircleAvatar(radius: 18),
  ];
}

List<Widget> buildStoreAppBar({
  required BuildContext context,
  required StoreType type,
  required List<String> tabLabelKeys,
  required TabController tabController,
  required List<String> tabs,
  required List<Widget> actionWidgets,
}) {
  // Разрешаем ключи табов в локализованные строки
  // TODO: [logic] добавить для всех остальных
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
