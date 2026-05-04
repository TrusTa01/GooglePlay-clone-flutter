import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/store/presentation/widgets/store_tabs_loaded_view.dart';
import 'package:google_play/features/tabs/presentation/viewmodels/available_tabs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/core/presentation/screens/error_screen.dart';

class StoreTabsScreen extends ConsumerWidget {
  final ProductKind productKind;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const StoreTabsScreen({
    super.key,
    required this.productKind,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableTabs = ref.watch(availableTabsProvider(productKind));

    return availableTabs.when(
      loading: () => const Scaffold(body: AppLoadingIndicator()),
      error: (e, _) => Scaffold(
        body: ErrorScreen(
          message: context.l10n.failedToLoadTabs(e),
          onRetry: () => ref.invalidate(availableTabsProvider(productKind)),
        ),
      ),
      data: (tabsData) {
        final String key =
            '${productKind.name}_${tabsData.map((t) => t.tabKey).join('|')}';

        return tabsData.isNotEmpty
            ? StoreTabsLoadedView(
                valueKey: ValueKey(key),
                productKind: productKind,
                tabsData: tabsData,
                onProductTap: onProductTap,
                onSeeAllTap: onSeeAllTap,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
