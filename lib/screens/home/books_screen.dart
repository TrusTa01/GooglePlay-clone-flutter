import 'package:flutter/material.dart';
import 'package:google_play/models/product_models/book_model.dart';
import 'package:google_play/widgets/lazy_tab_content.dart';
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

  // Список посещенных табов
  // 0 уже посещен, так как это стартовый таб
  final ValueNotifier<Set<int>> _visitedIndexes = ValueNotifier<Set<int>>({0});

  // Порядок должен совпадать с ключами в games_config.json
  final List<String> _tabs = [
    'Рекомендуем',
    'Топ продаж',
    'Новинки',
    'Жанры',
    'Топ бесплатных',
  ];

  // Ключи для маппинга tab UI → config
  final List<String> _tabKeys = [
    'recommended',
    'top_sales',
    'new_releases',
    'genres',
    'top_free',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final booksReadProvider = context.read<BooksProvider>();

      booksReadProvider.loadData();

      _loadCurrentTabSections();
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _visitedIndexes.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_visitedIndexes.value.contains(_tabController.index)) {
      _visitedIndexes.value = {..._visitedIndexes.value, _tabController.index};
    }

    if (_tabController.indexIsChanging) {
      _loadCurrentTabSections();
    }
  }

  void _loadCurrentTabSections() {
    final currentTabKey = _tabKeys[_tabController.index];
    final booksReadProvider = context.read<BooksProvider>();

    if (!booksReadProvider.isTabSectionsLoaded(currentTabKey)) {
      booksReadProvider.getSectionsForTab(currentTabKey);
    }
  }

  final List<Widget> _buildActionWidgets = [
    const SizedBox(width: 25),
    const CircleAvatar(radius: 18),
  ];

  @override
  Widget build(BuildContext context) {
    final booksReadProvider = context.read<BooksProvider>();
    final books = context.select<BooksProvider, List<Book>>((p) => p.books);

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
            body: ValueListenableBuilder(
              valueListenable: _visitedIndexes,
              builder: (context, visited, _) => TabBarView(
                physics:
                    const NeverScrollableScrollPhysics(), // Не переключать табы свайпом
                controller: _tabController,
                children: List.generate(_tabs.length, (index) {
                  final tabKey = _tabKeys[index];

                  return Builder(
                    builder: (context) {
                      if (!visited.contains(index)) {
                        return const SizedBox.shrink();
                      }
                      return CustomScrollView(
                        key: PageStorageKey<String>(tabKey),
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context,
                                ),
                          ),

                          if (tabKey == 'top_sales')
                            ...TopChartsScreen.asSliver(
                              context,
                              type: FilterType.books,
                              showFilters: true,
                            )
                          else if (tabKey == 'new_releases')
                            ...TopChartsScreen.asSliver(
                              context,
                              type: FilterType.books,
                              showFilters: true,
                            )
                          else if (tabKey == 'genres')
                            CategoriesTabScreen.asSliver(
                              categories: booksGenresData,
                              products: books,
                            )
                          else if (tabKey == 'top_free')
                            ...TopChartsScreen.asSliver(
                              context,
                              type: FilterType.books,
                              showFilters: true,
                            )
                          else
                            LazyTabContent(
                              tabKey: tabKey,
                              provider: booksReadProvider,
                              isSliver: true,
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
      ),
    );
  }
}
