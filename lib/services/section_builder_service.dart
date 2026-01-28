import '../models/models.dart';
import 'product_query_service.dart';

// Сервис для построения секций страниц из конфигураций.
// Преобразует PageConfig в список HomeSection для отображения в UI.
class SectionBuilderService {
  final List<Product> allProducts;
  final List<AppBanner> allBanners;
  final List<Product> recommendations;
  final List<PageConfig> pageConfigs;
  final ProductQueryService queryService;

  SectionBuilderService({
    required this.allProducts,
    required this.allBanners,
    required this.recommendations,
    required this.pageConfigs,
    required this.queryService,
  });

  // Получить конфигурацию страницы по ID
  PageConfig? getPageConfig(String id) {
    try {
      return pageConfigs.firstWhere((config) => config.id == id);
    } catch (e) {
      return null;
    }
  }

  // Построить секции из конфигурации страницы
  List<HomeSection> buildFromConfig(PageConfig pageConfig, {String? ageLabel}) {
    return pageConfig.sections.map((config) {
      // Подстановка $AGE_LABEL$ в заголовок
      String? title = config.title;
      if (title != null && ageLabel != null) {
        title = title.replaceAll('\$AGE_LABEL\$', ageLabel);
      }

      // Подстановка $AGE_LABEL$ в параметры данных
      Map<String, dynamic>? dataParams = config.dataParams;
      if (dataParams != null && ageLabel != null) {
        dataParams = Map.from(dataParams);
        dataParams.forEach((key, value) {
          if (value is String && value.contains('\$AGE_LABEL\$')) {
            dataParams![key] = value.replaceAll('\$AGE_LABEL\$', ageLabel);
          }
        });
      }

      return HomeSection(
        type: _mapType(config.type), 
        title: title ?? '',
        subtitle: config.subtitle,
        imageAssetPath: config.imageAssetPath,
        showButton: config.showButton,
        needsTopPadding: config.needsTopPadding,
        products: _resolveProducts(config.dataMethod, dataParams),
      );
    }).toList();
  }

  // Преобразование SectionConfigType в SectionType
  SectionType _mapType(SectionConfigType configType) {
    switch (configType) {
      case SectionConfigType.carousel:
        return SectionType.carousel;
      case SectionConfigType.grid:
        return SectionType.grid;
      case SectionConfigType.banners:
        return SectionType.banners;
      case SectionConfigType.preview:
        return SectionType.preview;
      case SectionConfigType.kidsHeroBanner:
        return SectionType.kidsHeroBanner;
      case SectionConfigType.ageFilterSelector:
        return SectionType.ageFIlterSelector;
    }
  }

  // Вспомогательный метод для конвертации возрастных меток
  Map<String, int> _getAgeRangeFromLabel(String ageLabel) {
    int minAge = 0;
    int maxAge = 999;

    switch (ageLabel) {
      case 'До 5 лет':
        minAge = 0;
        maxAge = 5;
        break;
      case 'От 6 до 8 лет':
        minAge = 6;
        maxAge = 8;
        break;
      case 'От 9 до 12 лет':
        minAge = 9;
        maxAge = 12;
        break;
      case '13+ лет':
        minAge = 13;
        maxAge = 999;
        break;
      default:
        minAge = 0;
        maxAge = 999;
    }
    return {'minAge': minAge, 'maxAge': maxAge};
  }

  // Логика связки строк из json с методами сервиса
  List<dynamic> _resolveProducts(String? methodName, Map<String, dynamic>? params) {
    if (methodName == null) return [];

    switch (methodName) {
      case 'getBannersByPrefix':
        final prefix = params?['prefix'] ?? '';
        return allBanners.where((b) {
          if (b is ActionBanner) return b.productId.startsWith(prefix);
          return true;
        }).toList();

      case 'getRecommendations':
        return recommendations;

      case 'getGameRecommendations':
        return queryService.getGameRecommendations(recommendations);

      case 'getAppRecommendations':
        return queryService.getAppRecommendations(recommendations);

      case 'getGamesByCategory':
        return queryService.getGamesByCategory(
          allProducts,
          params?['genre'] ?? '',
        );

      case 'getBooksByCategory':
        return queryService.getBooksByCategory(
          allProducts,
          params?['genre'] ?? '',
        );

      case 'getRecommendationsReversed':
        return recommendations.reversed.toList();

      case 'getGameRecommendationsReversed':
        return queryService.getGameRecommendationsReversed(recommendations);

      case 'getAppRecommendationsReversed':
        return queryService.getAppRecommendationsReversed(recommendations);

      case 'getPaidGamesByGenre':
        return queryService.getPaidGamesByGenre(
          allProducts,
          params?['genre'] ?? '',
        ).take(1).toList();

      case 'getAllPaidProductsTake':
        return queryService.getAllPaidProductsTake(
          allProducts,
          params?['count'] ?? 10,
        );

      case 'getAllPaidProductsUnderPrice':
        return queryService.getAllPaidProductsUnderPrice(
          allProducts,
          params?['price'] ?? 150,
        );

      case 'getProductsByTag':
        return queryService.getProductsByTag(
          allProducts,
          params?['query'] ?? '',
        );

      case 'getOfflineGames':
        return queryService.getOfflineGames(allProducts);

      case 'getKidsAgeRecommendations':
        return queryService.getKidsAgeRecommendations(
          recommendations,
          params?['age'] ?? 3,
        );

      case 'getKidsAgeRecommendationsByAgeRange':
        final ageLabel = params?['ageLabel'] ?? '';
        return queryService.getKidsAgeRecommendationsByAgeRange(
          recommendations,
          ageLabel,
          _getAgeRangeFromLabel,
        );

      case 'getProductsByTagAndAge':
        return queryService.getProductsByTagAndAge(
          allProducts,
          params?['query'] ?? '',
          params?['ageLabel'] ?? '',
          _getAgeRangeFromLabel,
        );

      case 'getGamesByCategoryAndAge':
        return queryService.getGamesByCategoryAndAge(
          allProducts,
          params?['genre'] ?? '',
          params?['ageLabel'] ?? '',
          _getAgeRangeFromLabel,
        );

      default:
        return [];
    }
  }

  // Построить страницу рекомендуемых игр
  List<HomeSection> buildGamesRecommendedPage() {
    final pageConfig = getPageConfig('gamesRecommended');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Построить страницу платных игр
  List<HomeSection> buildGamesPaidPage() {
    final pageConfig = getPageConfig('gamesPaid');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Построить страницу для детей
  List<HomeSection> buildKidsPage() {
    final pageConfig = getPageConfig('kidsPage');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Построить страницу категории для детей с возрастной меткой
  List<HomeSection> buildKidsCategoryPage(String ageLabel) {
    final pageConfig = getPageConfig('kidsCategoryPage');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig, ageLabel: ageLabel);
  }

  // Построить страницу рекомендуемых приложений
  List<HomeSection> buildAppsRecommendedPage() {
    final pageConfig = getPageConfig('appsRecommended');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Построить страницу рекомендуемых книг
  List<HomeSection> buildBooksRecommendedPage() {
    final pageConfig = getPageConfig('booksRecommended');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Построить секции для экрана события
  List<HomeSection> buildEventSections(SimpleBanner eventBanner) {
    if (eventBanner.eventCategory == null || eventBanner.eventCategory!.isEmpty) {
      return [];
    }

    final category = eventBanner.eventCategory!;
    final filteredProducts = queryService.getProductsByTag(
      allProducts,
      category,
    );

    if (filteredProducts.isEmpty) {
      return [];
    }

    final sections = <HomeSection>[];

    // Section 1: Carousel with top products
    if (filteredProducts.length >= 5) {
      sections.add(HomeSection(
        type: SectionType.carousel,
        title: 'Рекомендуем',
        products: filteredProducts.take(10).toList(),
        showButton: true,
      ));
    }

    // Section 2: Grid with more products
    if (filteredProducts.length >= 15) {
      sections.add(HomeSection(
        type: SectionType.grid,
        title: 'Популярное в категории',
        products: filteredProducts.skip(10).take(15).toList(),
        showButton: true,
      ));
    }

    // Section 3: Preview for games (if we have games)
    final games = filteredProducts.whereType<Game>().toList();
    if (games.length >= 3) {
      sections.add(HomeSection(
        type: SectionType.preview,
        title: 'Избранное',
        products: games.skip(5).take(3).toList(),
        showButton: false,
      ));
    }

    return sections;
  }
}
