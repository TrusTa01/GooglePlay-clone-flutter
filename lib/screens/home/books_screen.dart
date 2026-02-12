import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

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
                  final appBarSlivers = buildSliverTabbedAppBar(
                    context: context,
                    showLogo: false,
                    hasSearch: true,
                    searchHint: 'Поиск книг',
                    tabs: _tabs,
                    tabController: _tabController,
                    actions: _buildActionWidgets,
                  );
                  return [
                    // Шапка
                    appBarSlivers[0],
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                      // Табы
                      sliver: appBarSlivers[1],
                    ),
                  ];
                },
            body: TabBarView(
              physics:
                  const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
              controller: _tabController,
              children: _tabs.map((tabName) {
                return Builder(
                  builder: (context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(tabName),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
                        ),
                        if (tabName == 'Рекомендуем')
                          GenericTabScreen.asSliver(
                            sections: watchProvider.recommendedBooksSection,
                            onLoad: () => readProvider.getRecomendations(),
                          )
                        else if (tabName == 'Топ продаж')
                          ...TopChartsScreen.buildSlivers(
                            context,
                            type: FilterType.books,
                            showFilters: true,
                          )
                        else if (tabName == 'Новинки')
                          ...TopChartsScreen.buildSlivers(
                            context,
                            type: FilterType.books,
                            showFilters: true,
                          )
                        else if (tabName == 'Жанры')
                          CategoriesTabScreen.asSliver(
                            categories: booksGenresData,
                            products: watchProvider.books,
                          )
                        else if (tabName == 'Топ бесплатных')
                          ...TopChartsScreen.buildSlivers(
                            context,
                            type: FilterType.books,
                            showFilters: true,
                          ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
