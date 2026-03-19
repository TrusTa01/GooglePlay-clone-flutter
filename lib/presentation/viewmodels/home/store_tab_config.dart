import 'package:google_play/domain/entities/store/store_type.dart';

final class StoreTabConfig {
  final String label; // ключ для l10n, например 'tabRecommended'
  final String key; // таб-ключ, например 'recommended'
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

final class StoreScreenConfig {
  final StoreType type; // apps/games/books
  final List<StoreTabConfig> tabs;

  const StoreScreenConfig({required this.type, required this.tabs});
}

/// Единый справочник метаданных табов стора
/// Сами ключи табов и их порядок для каждого стора
/// приходят из внешнего index.json, а здесь остаются
/// только флаги поведения и ключи для локализации
const Map<String, StoreTabConfig> kStoreTabsMetadata = {
  'recommended': StoreTabConfig(
    label: 'tabRecommended',
    key: 'recommended',
    usesBanners: true,
  ),
  'top_charts': StoreTabConfig(
    label: 'tabTopCharts',
    key: 'top_charts',
    isTopCharts: true,
  ),
  'kids': StoreTabConfig(label: 'tabKids', key: 'kids', usesBanners: true),
  'paid': StoreTabConfig(label: 'tabPaid', key: 'paid'),
  'categories': StoreTabConfig(
    label: 'tabCategories',
    key: 'categories',
    isCategoriesTab: true,
  ),
};

List<StoreTabConfig> buildStoreTabs(List<String> tabKeys) {
  return tabKeys
      .map((key) => kStoreTabsMetadata[key])
      .whereType<StoreTabConfig>()
      .toList();
}
