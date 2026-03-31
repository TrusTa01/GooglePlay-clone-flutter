import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/auth/presentation/widgets/login_circle_avatar.dart';
import 'package:google_play/features/shared/presentation/widgets/components/app_bars/tabbed_app_bar.dart';
import 'package:google_play/features/shared/presentation/widgets/components/popups/language_popup_menu.dart';

List<Widget> buildStoreActionWidgets({
  required StoreType type,
  required BuildContext context,
}) {
  return const [LanguagePopupMenu(), SizedBox(width: 10), LoginCircleAvatar()];
}

List<Widget> buildStoreAppBar({
  required BuildContext context,
  required StoreType type,
  required List<String> tabLabelKeys,
  required TabController tabController,
  required List<String> tabs,
  required List<Widget> actionWidgets,
}) {
  List<String> resolveTabLabels() {
    return tabLabelKeys.map(context.l10nKey).toList();
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
