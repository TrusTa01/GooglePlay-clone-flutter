import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      final List<String> _tabs = ['Рекомендуем', 'Лучшее', 'Детям', 'Платные', 'Категории'];

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabsProvider>(
      create: (context) {
        final tabsProvider = TabsProvider();
        tabsProvider.setTabs(_tabs);
        return tabsProvider;
      },
      child: Scaffold(
        appBar: AppBars(
            type: AppBarType.tabbed,
            showLogo: true,
            logoAssetPath: 'assets/images/logo.png',
            actions: [
              IconButton(
              onPressed: () => Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(AppRoutesName.notificationsScreen,),
              icon: Icon(Icons.notifications_outlined),
            ),
              const SizedBox(width: 10,),
              CircleAvatar(radius: 18),
              const SizedBox(width: 20,)
            ],
            tabs: _tabs,
            tabController: _tabController,
          ),
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent('Рекомендуемые игры'),
                _buildTabContent('Лучшие игры'),
                _buildTabContent('Игры для детей'),
                _buildTabContent('Платные игры'),
                _buildTabContent('Категории игр'),
              ],
            ),
          ),
    );
  }
  
  Widget _buildTabContent(String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(text, style: const TextStyle(fontSize: 24)),
    ],
  );
}
}
