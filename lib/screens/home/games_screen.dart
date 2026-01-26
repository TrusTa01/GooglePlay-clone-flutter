import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '../../widgets/widgets.dart';
import '../../core/routes/routes.dart';
import '../../providers/providers.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _tabs = [
    'Рекомендуем',
    'Лучшее',
    'Детям',
    'Платные',
    'Категории',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _tabController.index;

    final watchProvider = context.watch<ProductsProvider>();
    final readProvider = context.read<ProductsProvider>();

    final AppBarType appBarType = switch (currentIndex) {
      0 || 1 || 2 || 3 || 4 => AppBarType.tabbed,
      _ => AppBarType.tabbed,
    };

    final List<Widget> actionWidgets = [
      if (appBarType == AppBarType.tabbed)
        IconButton(
          onPressed: () => Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamed(AppRoutesName.notificationsScreen),
          icon: const Icon(Icons.notifications_outlined),
        ),

      const SizedBox(width: 10),
      CircleAvatar(radius: 18),
      const SizedBox(width: 25),
    ];

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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return buildSliverTabbedAppBar(
              context: context,
              showLogo: true,
              tabs: _tabs,
              tabController: _tabController,
              actions: actionWidgets,
              forceElevated: false,
            );
          },
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
            children: [
              // Таб 'Рекомендуем'
              GenericTabScreen(
                sections: watchProvider.recommendedGamesSection,
                onLoad: () => readProvider.getRecomendations(),
              ),
              // Таб 'Лучшее'
              const TopChartsScreen(type: FilterType.games),
              // Таб 'Детям'
              GenericTabScreen(sections: watchProvider.kidsPaidSection),
              // Таб 'Платные'
              GenericTabScreen(sections: watchProvider.paidGamesSection),
              // Таб 'Категории'
              CategoriesTabScreen(categories: gamesCategoriesData),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
