import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:google_play/presentation/viewmodels/home/home_providers.dart';
import 'package:google_play/presentation/viewmodels/home/store_tab_config.dart';

class StoreTabScreen extends HookConsumerWidget {
  final StoreType storeType;
  final StoreScreenConfig config;

  const StoreTabScreen({
    super.key,
    required this.storeType,
    required this.config,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vsync = useSingleTickerProvider();

    final visitedIndexes = useState<Set<int>>({0});
    final tabs = config.tabs.map((t) => t.label).toList();

    final tabController = useTabController(
      initialLength: config.tabs.length,
      vsync: vsync,
    );

    final homeProvider = ref.read(homeViewModelProvider(storeType).notifier);

    useEffect(() {
      final tabsConfig = config.tabs;

      void listener() {
        final index = tabController.index;
        final tabKey = tabsConfig[index].key;

        if (!visitedIndexes.value.contains(index)) {
          visitedIndexes.value = {...visitedIndexes.value, index};
        }

        homeProvider.loadTabSections(tabKey);
      }

      tabController.addListener(listener);
      
      final initialTabKey = tabsConfig[0].key;
      homeProvider.loadTabSections(initialTabKey);
      homeProvider.loadProducts();

      return null;
    }, const []);

    final state = ref.watch(homeViewModelProvider(storeType));
    final products = state.products;

    final tabLabels = config.tabs.map((t) => t.label).toList();

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            final appBarSlivers = buildStoreAppBar(
              type: storeType,
              tabLabels: tabLabels,
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
              final tabConfig = config.tabs[index];
              final tabKey = tabConfig.key;
              final sectionsState =
                  state.sectionsByTab[tabKey] ??
                  const AsyncValue<List<SectionEntity>>.data([]);

              return Builder(
                builder: (context) {
                  if (!visitedIndexes.value.contains(index)) {
                    return const SizedBox.shrink();
                  }

                  return CustomScrollView(
                    key: PageStorageKey<String>(tabKey),
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context,
                        ),
                      ),
                      // Контент
                      ...buildStoreTabSlivers(
                        context: context,
                        tabKey: tabKey,
                        products: products,
                        sectionsState: sectionsState,
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
