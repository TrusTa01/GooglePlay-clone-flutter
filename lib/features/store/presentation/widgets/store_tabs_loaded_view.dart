import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/presentation/widgets/components/app_bars/utils/store_app_bar_utils.dart';
import 'package:google_play/features/sections/presentation/viewmodels/section_state.dart';
import 'package:google_play/features/sections/presentation/widgets/resolved_sections_view.dart';
import 'package:google_play/features/sections/presentation/widgets/section_widget_builder.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreTabsLoadedView extends HookConsumerWidget {
  final ValueKey valueKey;
  final List<TabsEntity> tabsData;
  final ProductKind productKind;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const StoreTabsLoadedView({
    super.key,
    required this.valueKey,
    required this.tabsData,
    required this.productKind,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vsync = useSingleTickerProvider();
    final tabController = useTabController(
      initialLength: tabsData.length,
      vsync: vsync,
    );
    final visitedTabKeys = useState<Set<String>>({
      '${productKind.name}_${tabsData.first.tabKey}',
    });

    final tabsSignature = tabsData.map((e) => e.tabKey).join('|');

    useEffect(() {
      visitedTabKeys.value = {'${productKind.name}_${tabsData.first.tabKey}'};

      void listener() {
        if (tabController.indexIsChanging) return;
        final i = tabController.index;
        if (i < 0 || i >= tabsData.length) return;
        final String key = '${productKind.name}_${tabsData[i].tabKey}';
        if (visitedTabKeys.value.contains(key)) return;
        visitedTabKeys.value = {...visitedTabKeys.value, key};
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController, valueKey, tabsSignature]);

    final tabLabels = tabsData.map((t) => t.label).toList();

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            final appBarSlivers = buildStoreAppBar(
              context: context,
              type: productKind,
              tabLabelKeys: tabLabels,
              tabController: tabController,
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
            children: List.generate(tabsData.length, (index) {
              final tabConfig = tabsData[index];
              final tabKey = tabConfig.tabKey;
              final visitedKey = '${productKind.name}_$tabKey';

              return Builder(
                builder: (context) {
                  if (!visitedTabKeys.value.contains(visitedKey)) {
                    return const SizedBox.shrink();
                  }

                  final sectionState = ref.watch(
                    resolvedSectionsProvider(productKind, tabConfig.tabKey),
                  );

                  return CustomScrollView(
                    key: PageStorageKey<String>(visitedKey),
                    slivers: [
                      SliverOverlapInjector(
                        handle:
                            NestedScrollView.sliverOverlapAbsorberHandleFor(
                              context,
                            ),
                      ),
                      ResolvedSectionsView(
                        sectionState: sectionState,
                        isSliver: true,
                        storageId: visitedKey,
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
  }
}
