import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import '../../providers/tabs_provider.dart';
import '../../core/routes/routes.dart';

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
          actions: [
            IconButton(
              onPressed: () => Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(AppRoutesName.notificationsScreen,),
              icon: Icon(Icons.notifications_outlined),
            ),
            const SizedBox(width: 10),
            CircleAvatar(radius: 18),
            const SizedBox(width: 20),
          ],
          tabs: _tabs,
          tabController: _tabController,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent(''),
            _buildTabContent(''),
            _buildTabContent(''),
            _buildTabContent(''),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String text) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
