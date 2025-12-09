import 'package:flutter/material.dart';
import 'package:google_play/providers/tabs_provider.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
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
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
            ),
            const SizedBox(width: 10),
            CircleAvatar(radius: 16),
            const SizedBox(width: 20),
          ],
          tabs: _tabs,
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent('Рекомендуемые Приложения'),
            _buildTabContent('Лучшие игры'),
            _buildTabContent('Игры для детей'),
            _buildTabContent('Категории игр'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String text) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
