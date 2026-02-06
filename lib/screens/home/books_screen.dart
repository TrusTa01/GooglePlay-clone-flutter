import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '../../widgets/widgets.dart';
import '../../providers/providers.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _tabs = [
    'Рекомендуем',
    'Топ продаж',
    'Новинки',
    'Жанры',
    'Топ бесплатных',
  ];

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

  final List<Widget> _buildActionWidgets = [
      const SizedBox(width: 25),
      const CircleAvatar(radius: 18),
    ];

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<ProductsProvider>();
    final readProvider = context.read<ProductsProvider>();

    return ChangeNotifierProvider(
      create: (context) {
        final tabsProvider = TabsProvider();
        tabsProvider.setTabs(_tabs);
        return tabsProvider;
      },
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return buildSliverTabbedAppBar(
                    context: context,
                    showLogo: true,
                    tabs: _tabs,
                    tabController: _tabController,
                    actions: _buildActionWidgets,
                    forceElevated: false,
                  );
                },
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
              children: [
                // Таб 'Рекомендуем'
                GenericTabScreen(
                  sections: watchProvider.recommendedBooksSection,
                  onLoad: () => readProvider.getRecomendations(),
                ),
                // Таб 'Топ продаж'
                ChangeNotifierProvider(
                  create: (_) =>
                      FilterProvider.forBooks(selectedTopFilter: 'Бестселлеры'),
                  child: const TopChartsScreen(type: FilterType.books),
                ),
                // Таб 'Новинки'
                ChangeNotifierProvider(
                  create: (_) => FilterProvider.forBooks(filterOnlyMode: true),
                  child: const TopChartsScreen(type: FilterType.books),
                ),
                // Таб 'Жанры'
                CategoriesTabScreen(
                  categories: booksGenresData,
                  products: watchProvider.books,
                ),
                // Таб 'Топ бесплатных'
                ChangeNotifierProvider(
                  create: (_) => FilterProvider.forBooks(
                    selectedTopFilter: 'Топ бесплатных',
                  ),
                  child: const TopChartsScreen(type: FilterType.books),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
