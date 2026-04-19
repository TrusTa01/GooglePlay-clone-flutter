import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/auth/presentation/widgets/login_circle_avatar.dart';
import 'package:google_play/core/presentation/widgets/components/app_bars/tabbed_app_bar.dart';
import 'package:google_play/core/presentation/widgets/components/popups/language_popup_menu.dart';

List<Widget> buildStoreActionWidgets({
  required ProductKind type,
  required BuildContext context,
}) {
  return const [LanguagePopupMenu(), SizedBox(width: 10), LoginCircleAvatar()];
}

List<Widget> buildStoreAppBar({
  required BuildContext context,
  required ProductKind type,
  required List<String> tabLabelKeys,
  required TabController tabController,
  required List<String> tabs,
  required List<Widget> actionWidgets,
}) {
  final localizedTabs = List<String>.unmodifiable(tabLabelKeys);

  return switch (type) {
    ProductKind.game || ProductKind.app => buildSliverTabbedAppBar(
      tabs: localizedTabs,
      tabController: tabController,
      actions: actionWidgets,
    ),
    ProductKind.book => buildSliverTabbedAppBar(
      showLogo: false,
      hasSearch: true,
      searchHint: context.l10n.searchBooksHint,
      tabs: localizedTabs,
      tabController: tabController,
      actions: actionWidgets,
    ),
  };
}
