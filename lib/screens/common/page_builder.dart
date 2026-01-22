import '/models/models.dart';
import '/providers/providers.dart';

class PageBuilder {
  final ProductsProvider provider;

  PageBuilder(this.provider);

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

  // Логика связки строк из json с методами Provider
  List<dynamic> _resolveProducts(String? methodName, Map<String, dynamic>? params) {
    if (methodName == null) return [];

    switch (methodName) {
      case 'getBannersByPrefix':
        return provider.getBannersByPrefix(params?['prefix'] ?? '');
      case 'getRecommendations':
        return provider.recommendations;
      case 'getGamesByCategory':
        return provider.getGamesByCategory(params?['genre'] ?? '');
      case 'getRecommendationsReversed':
        return provider.recommendations.reversed.toList();
      case 'getPaidGamesByGenre':
        return provider.getPaidGamesByGenre(params?['genre'] ?? '').take(1).toList();
      case 'getAllPaidProductsTake':
        return provider.getAllPaidProductsTake(params?['count'] ?? 10);
      case 'getAllPaidProductsUnderPrice':
        return provider.getAllPaidProductsUnderPrice(params?['price'] ?? 150);
      case 'getProductsByTag':
        return provider.getProductsByTag(params?['query'] ?? '');
      case 'getOfflineGames':
        return provider.getOfflineGames();
      case 'getKidsAgeRecommendations':
        return provider.getKidsAgeRecommendations(params?['age'] ?? 3);
      case 'getKidsAgeRecommendationsByAgeRange':
        return provider.getKidsAgeRecommendationsByAgeRange(params?['ageLabel'] ?? '');
      case 'getProductsByTagAndAge':
        return provider.getProductsByTagAndAge(
          params?['query'] ?? '',
          params?['ageLabel'] ?? '',
        );
      case 'getGamesByCategoryAndAge':
        return provider.getGamesByCategoryAndAge(
          params?['genre'] ?? '',
          params?['ageLabel'] ?? '',
        );
      default:
        return [];
    }
  }

  // Рекомендуемые игры
  List<HomeSection> buildGamesRecommendedPage() {
    final pageConfig = provider.getPageConfig('gamesRecommended');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Платные игры
  List<HomeSection> buildGamesPaidPage() {
    final pageConfig = provider.getPageConfig('gamesPaid');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  // Детям
  List<HomeSection> buildKidsPage() {
    final pageConfig = provider.getPageConfig('kidsPage');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }

  List<HomeSection> buildKidsCategoryPage(String ageLabel) {
    final pageConfig = provider.getPageConfig('kidsCategoryPage');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig, ageLabel: ageLabel);
  }

  // Рекомендуемые приложения
  List<HomeSection> buildAppsRecommendedPage() {
    final pageConfig = provider.getPageConfig('appsRecommended');
    if (pageConfig == null) return [];
    return buildFromConfig(pageConfig);
  }
}
