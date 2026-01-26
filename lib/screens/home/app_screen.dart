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
    final watchProvider = context.watch<ProductsProvider>();
    final readProvider = context.read<ProductsProvider>();

    final List<Widget> actionWidgets = [
      IconButton(
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRoutesName.notificationsScreen),
        icon: const Icon(Icons.notifications_outlined),
      ),

      const SizedBox(width: 3),
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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
        ),
      ),
    );
  }
}
