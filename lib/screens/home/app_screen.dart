import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '../../widgets/widgets.dart';
import '../../core/routes/routes.dart';
import '../../providers/providers.dart';

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
      0 || 1 || 2 || 3 => AppBarType.tabbed,
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
        appBar: AppBars(
          type: appBarType,
          showLogo: appBarType == AppBarType.tabbed ? true : false,
          actions: actionWidgets,

          // // Для AppBarType.searchWithTabbs
          // searchHint: appBarType == AppBarType.searchWithTabbs
          //     ? 'Поиск приложений и игр'
          //     : null,

          // inputLeading: appBarType == AppBarType.searchWithTabbs
          //     ? [const Icon(Icons.search)]
          //     : null,

          // inputActions: appBarType == AppBarType.searchWithTabbs
          //     ? [const Icon(Icons.mic_none_outlined)]
          //     : null,
          tabs: _tabs,
          tabController: _tabController,
        ),

        body: TabBarView(
          controller: _tabController,
          physics:
              const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
          children: [
            // Таб 'Рекомендуем'
            GenericTabScreen(
              sections: watchProvider.recommendedAppsSection,
              onLoad: () => readProvider.getRecomendations(),
            ),
            // Таб 'Лучшее'
            const TopChartsScreen(type: FilterType.apps),
            // Таб 'Детям'
            GenericTabScreen(sections: watchProvider.kidsPaidSection),
            // Таб 'Категории'
            CategoriesTabScreen(categories: appsCategoriesData),
          ],
        ),
      ),
    );
  }
}
