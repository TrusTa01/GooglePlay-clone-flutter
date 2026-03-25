import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/sections/presentation/widgets/resolved_sections_view.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:google_play/features/tabs/presentation/viewmodels/store_tabs_provider.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';
import 'package:google_play/features/shared/presentation/screens/error_screen.dart';

class StoreTabScreen extends HookConsumerWidget {
  final StoreType storeType;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const StoreTabScreen({
    super.key,
    required this.storeType,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vsync = useSingleTickerProvider();

    final tabsAsync = ref.watch(storeTabsProvider(storeType));
    final homeProvider = ref.read(homeViewModelProvider(storeType).notifier);
    final homeState = ref.watch(homeViewModelProvider(storeType));

    return tabsAsync.when(
      loading: () => const Scaffold(body: AppLoadingIndicator()),
      error: (e, _) => Scaffold(
        body: ErrorScreen(
          message: context.l10n.failedToLoadTabs(e),
          onRetry: () => ref.invalidate(storeTabsProvider(storeType)),
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
            final tabKey = tabsData[index].key;

            if (!visitedIndexes.value.contains(index)) {
              visitedIndexes.value = {...visitedIndexes.value, index};
            }

            homeProvider.loadTabSections(tabKey);
          }

          tabController.addListener(listener);

          // Загружаем первый таб и продукты
          homeProvider.loadTabSections(tabsData[0].key);
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
                      type: storeType,
                      tabLabelKeys: tabLabels,
                      tabController: tabController,
                      tabs: tabs,
                      actionWidgets: buildStoreActionWidgets(
                        type: storeType,
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
                  final tabKey = tabConfig.key;
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
                            storageId: '${storeType.name}_$tabKey',
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
