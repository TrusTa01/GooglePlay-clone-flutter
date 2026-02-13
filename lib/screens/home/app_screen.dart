import 'package:flutter/material.dart';
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
  final List<String> _tabs = ['Рекомендуем', 'Лучшее', 'Детям', 'Категории'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
    final watchProvider = context.watch<ProductsProvider>();
    final readProvider = context.read<ProductsProvider>();

    return ChangeNotifierProvider<TabsProvider>(
      create: (context) {
        final tabsProvider = TabsProvider();
        tabsProvider.setTabs(_tabs);
        return tabsProvider;
      },
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
            body: TabBarView(
              physics:
                  const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
              controller: _tabController,
              children: _tabs.map((tabName) {
                return Builder(
                  builder: (context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(tabName),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
                        ),
                        if (tabName == 'Рекомендуем')
                          GenericTabScreen.asSliver(
                            sections: watchProvider.recommendedAppsSection,
                            onLoad: () => readProvider.getRecomendations(),
                          )
                        else if (tabName == 'Лучшее')
                          ...TopChartsScreen.buildSlivers(
                            context,
                            type: FilterType.apps,
                            showFilters: true,
                          )
                        else if (tabName == 'Детям')
                          GenericTabScreen.asSliver(
                            sections: watchProvider.kidsPaidSection,
                          )
                        else if (tabName == 'Категории')
                          CategoriesTabScreen.asSliver(
                            categories: appsCategoriesData,
                            products: watchProvider.apps,
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
    );
  }
}
