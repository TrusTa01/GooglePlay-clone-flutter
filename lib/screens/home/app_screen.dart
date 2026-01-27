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
      const SizedBox(width: 25),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                    actions: _buildActionWidgets(context),
                    forceElevated: false,
                  );
                },
            body: TabBarView(
              controller: _tabController,
              physics:
                  const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
              children: [
                // Таб 'Рекомендуем'
                Consumer<ProductsProvider>(
                  builder: (context, productsProvider, _) =>
                      GenericTabScreen(
                    sections: productsProvider.recommendedAppsSection,
                    onLoad: () => productsProvider.getRecomendations(),
                  ),
                ),
                // Таб 'Лучшее'
                const TopChartsScreen(type: FilterType.apps),
                // Таб 'Детям'
                Consumer<ProductsProvider>(
                  builder: (context, productsProvider, _) =>
                      GenericTabScreen(
                    sections: productsProvider.kidsPaidSection,
                  ),
                ),
                // Таб 'Категории'
                Consumer<ProductsProvider>(
                  builder: (context, productsProvider, _) =>
                      CategoriesTabScreen(
                    categories: appsCategoriesData,
                    products: productsProvider.apps,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
