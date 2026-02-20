import 'package:flutter/material.dart';
import 'package:google_play/models/product_models/app_model.dart';
import 'package:google_play/widgets/lazy_tab_content.dart';
import 'package:provider/provider.dart';
import 'package:google_play/core/routes/routes.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key});

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final TabsProvider _tabsProvider;

  // Список посещенных табов
  // 0 уже посещен, так как это стартовый таб
  final ValueNotifier<Set<int>> _visitedIndexes = ValueNotifier<Set<int>>({0});

  // Порядок должен совпадать с ключами в games_config.json
  final List<String> _tabs = ['Рекомендуем', 'Лучшее', 'Детям', 'Категории'];

  // Ключи для маппинга tab UI → config
  final List<String> _tabKeys = [
    'recommended',
    'top_charts',
    'kids',
    'paid',
    'categories',
  ];

  @override
  void initState() {
    super.initState();
    _tabsProvider = TabsProvider();
    _tabsProvider.setTabs(_tabs);
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appsReadProvider = context.read<AppsProvider>();
      final bannersReadProvider = context.read<BannersProvider>();

      appsReadProvider.loadData(bannersReadProvider);

      _loadCurrentTabSections();
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _visitedIndexes.dispose();
    _tabsProvider.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_visitedIndexes.value.contains(_tabController.index)) {
      _visitedIndexes.value = {..._visitedIndexes.value, _tabController.index};
    }

    if (_tabController.indexIsChanging) {
      _loadCurrentTabSections();
    }
  }

  void _loadCurrentTabSections() {
    final currentTabKey = _tabKeys[_tabController.index];
    final appsReadProvider = context.read<AppsProvider>();
    final bannersReadProvider = context.read<BannersProvider>();

    if (!appsReadProvider.isTabSectionsLoaded(currentTabKey)) {
      appsReadProvider.getSectionsForTab(currentTabKey, bannersReadProvider);
    }
  }

  List<Widget> _buildActionWidgets(BuildContext context) {
    return [
      IconButton(
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRoutesName.notificationsScreen),
        icon: const Icon(Icons.notifications_outlined),
      ),
      const SizedBox(width: 10),
      const CircleAvatar(radius: 18),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final appsReadProvider = context.read<AppsProvider>();
    final bannersReadProvider = context.read<BannersProvider>();
    final apps = context.select<AppsProvider, List<App>>((p) => p.apps);

    return ChangeNotifierProvider<TabsProvider>.value(
      value: _tabsProvider,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  final appBarSlivers = buildSliverTabbedAppBar(
                    context: context,
                    showLogo: true,
                    tabs: _tabs,
                    tabController: _tabController,
                    actions: _buildActionWidgets(context),
                    forceElevated: false,
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
            body: ValueListenableBuilder<Set<int>>(
              valueListenable: _visitedIndexes,
              builder: (context, visited, _) => TabBarView(
                physics:
                    const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
                controller: _tabController,
                children: List.generate(_tabs.length, (index) {
                  final tabKey = _tabKeys[index];

                  return Builder(
                    builder: (context) {
                      if (!visited.contains(index)) {
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

                          if (tabKey == 'top_charts')
                            ...TopChartsScreen.asSliver(
                              context,
                              type: FilterType.apps,
                              showFilters: true,
                            )
                          else if (tabKey == 'categories')
                            CategoriesTabScreen.asSliver(
                              categories: appsCategoriesData,
                              products: apps,
                            )
                          else
                            LazyTabContent(
                              tabKey: tabKey,
                              provider: appsReadProvider,
                              bannersProvider: bannersReadProvider,
                              isSliver: true,
                            ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
