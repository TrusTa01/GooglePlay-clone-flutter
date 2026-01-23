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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Таб 'Рекомендуем'
            GenericTabScreen(
              sections: watchProvider.recommendedBooksSection,
              onLoad: () => readProvider.getRecomendations(),
            ),
            // Таб 'Топ продаж'
            ChangeNotifierProvider(
              create: (_) => FilterProvider.forBooks(
                selectedTopFilter: 'Бестселлеры',
              ),
              child: const TopChartsScreen(
                type: FilterType.books,
                booksTabMode: BooksTabMode.topSales,
              ),
            ),
            // Таб 'Новинки'
            ChangeNotifierProvider(
              create: (_) => FilterProvider.forBooks(
                isToggleFilterActive: true,
              ),
              child: const TopChartsScreen(
                type: FilterType.books,
                booksTabMode: BooksTabMode.newReleases,
              ),
            ),
            // Таб 'Жанры'
            CategoriesTabScreen(categories: booksGenresData),
            // Таб 'Топ бесплатных'
            ChangeNotifierProvider(
              create: (_) => FilterProvider.forBooks(
                selectedTopFilter: 'Топ бесплатных',
              ),
              child: const TopChartsScreen(
                type: FilterType.books,
                booksTabMode: BooksTabMode.topFree,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
