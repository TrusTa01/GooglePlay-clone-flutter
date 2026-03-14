final class StoreTabConfig {
  final String label; // 'Рекомендуем'
  final String key; // 'recommended'
  final bool isTopCharts; // нужно ли показывать TopChartsScreen
  final bool isCategoriesTab; // нужно ли показывать CategoriesTabScreen/genres
  final bool usesBanners; // нужно ли прокидывать BannersProvider

  const StoreTabConfig({
    required this.label,
    required this.key,
    this.isTopCharts = false,
    this.isCategoriesTab = false,
    this.usesBanners = false,
  });
}

enum StoreType { games, apps, books }

final class StoreScreenConfig {
  final StoreType type; // apps/games/books
  final List<StoreTabConfig> tabs;

  const StoreScreenConfig({required this.type, required this.tabs});
}

const gamesStoreScreenConfig = StoreScreenConfig(
  type: StoreType.games,
  tabs: [
    StoreTabConfig(label: 'Рекомендуем', key: 'recomminded', usesBanners: true),
    StoreTabConfig(label: 'Лучшее', key: 'top_charts', isTopCharts: true),
    StoreTabConfig(label: 'Детям', key: 'kids', usesBanners: true),
    StoreTabConfig(label: 'Платные', key: 'paid'),
    StoreTabConfig(label: 'Категории', key: 'categories', isCategoriesTab: true),
  ],
);

const appsStoreScreenConfig = StoreScreenConfig(
  type: StoreType.apps, 
  tabs: [],
);

const booksStoreScreenConfig = StoreScreenConfig(
  type: StoreType.books,
  tabs: [],
);
