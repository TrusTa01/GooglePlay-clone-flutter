import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_play/widgets/widgets.dart';
import '../../providers/tabs_provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _tabs = ['Рекомендуем', 'Лучшее', 'Новинки', 'Жанры', 'Топ бесплатных'];

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
          type: AppBarType.searchWithTabbs,
          inputLeading: [Icon(Icons.search)],
          inputActions: [Icon(Icons.mic_none_outlined)],
          searchHint: 'Поиск книг',
          actions: [
            const SizedBox(width: 4),
            CircleAvatar(radius: 18),
            const SizedBox(width: 20),
          ],
          tabs: _tabs,
          tabController: _tabController,
          onSearchChanged: (value) {},
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent(''),
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
