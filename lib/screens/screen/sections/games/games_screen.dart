import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../screens.dart';
import '/providers/tabs_provider.dart';
import '/widgets/widgets.dart';
import '/routes/routes.dart';

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

    final AppBarType appBarType = switch (currentIndex) {
      0 || 1 || 3 || 4 => AppBarType.tabbed,
      2 => AppBarType.searchWithTabbs,
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
          logoAssetPath: 'assets/images/logo.png',
          actions: actionWidgets,

          // Для AppBarType.searchWithTabbs
          searchHint: appBarType == AppBarType.searchWithTabbs
              ? 'Поиск приложений и игр'
              : null,

          inputLeading: appBarType == AppBarType.searchWithTabbs
              ? [const Icon(Icons.search)]
              : null,

          inputActions: appBarType == AppBarType.searchWithTabbs
              ? [const Icon(Icons.mic_none_outlined)]
              : null,

          tabs: _tabs,
          tabController: _tabController,
        ),

        body: TabBarView(
          controller: _tabController,
          children: const [
           GamesRecommendedTab(),
           GamesBestTab(),
           GamesKidsTab(),
           GamesPaidTab(),
           GamesCategoriesTab(),
          ],
        ),
      ),
    );
  }
}
