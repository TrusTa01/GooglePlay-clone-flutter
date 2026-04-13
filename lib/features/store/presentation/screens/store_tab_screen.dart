import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/features/store/presentation/viewmodels/home_view_model.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/core/presentation/screens/error_screen.dart';

class StoreTabScreen extends HookConsumerWidget {
  final ProductKind productKind;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const StoreTabScreen({
    super.key,
    required this.productKind,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vsync = useSingleTickerProvider();

    final tabsAsync = ref.watch(storeTabsProvider(productKind));
    final homeProvider = ref.read(homeViewModelProvider(productKind).notifier);
    final homeState = ref.watch(homeViewModelProvider(productKind));

    return tabsAsync.when(
      loading: () => const Scaffold(body: AppLoadingIndicator()),
      error: (e, _) => Scaffold(
        body: ErrorScreen(
          message: context.l10n.failedToLoadTabs(e),
          onRetry: () => ref.invalidate(storeTabsProvider(productKind)),
        ),
      ),
      data: (tabsData) {
        if (tabsData.isEmpty) return const SizedBox.shrink();

        final visitedIndexes = useState<Set<int>>({0});
        final tabs = tabsData.map((t) => t.label).toList();

        final tabController = useTabController(
          initialLength: tabsData.length,
          vsync: vsync,
        );

        useEffect(() {
          void listener() {
            if (tabController.indexIsChanging) return;

            final index = tabController.index;
            final tabKey = tabsData[index].tabKey;

            if (!visitedIndexes.value.contains(index)) {
              visitedIndexes.value = {...visitedIndexes.value, index};
            }

            homeProvider.loadTabSections(tabKey);
          }

          tabController.addListener(listener);

          // Загружаем первый таб и продукты
          homeProvider.loadTabSections(tabsData[0].tabKey);
          homeProvider.loadProducts();

          return () => tabController.removeListener(listener);
        }, [tabsData]);

        final tabLabels = tabsData.map((t) => t.label).toList();

        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                    final appBarSlivers = buildStoreAppBar(
                      context: context,
                      type: productKind,
                      tabLabelKeys: tabLabels,
                      tabController: tabController,
                      tabs: tabs,
                      actionWidgets: buildStoreActionWidgets(
                        type: productKind,
                        context: context,
                      ),
                    );
                    return [
                      // Шапка
                      appBarSlivers[0],
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context,
                        ),
                        // Табы
                        sliver: appBarSlivers[1],
                      ),
                    ];
                  },
              body: TabBarView(
                physics:
                    const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
                controller: tabController,
                children: List.generate(tabs.length, (index) {
                  final tabConfig = tabsData[index];
                  final tabKey = tabConfig.tabKey;
                  final sectionState =
                      homeState.sectionsByTab[tabKey] ??
                      const AsyncValue<List<ResolvedSection>>.loading();

                  return Builder(
                    builder: (context) {
                      if (!visitedIndexes.value.contains(index)) {
                        return const SizedBox.shrink();
                      }

                      return CustomScrollView(
                        key: PageStorageKey<String>(tabKey),
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context,
                                ),
                          ),
                          // Контент
                          ResolvedSectionsView(
                            sectionState: sectionState,
                            isSliver: true,
                            storageId: '${productKind.name}_$tabKey',
                            onProductTap: onProductTap,
                            onSeeAllTap: onSeeAllTap,
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
