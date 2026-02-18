import 'package:google_play/models/models.dart';
import 'package:google_play/services/product_query_service.dart';

/// Преобразует метку возраста (До 5 лет, От 6 до 8 лет и т.д.) в диапазон [minAge], [maxAge].
Map<String, int> _getAgeRangeFromLabel(String ageLabel) {
  switch (ageLabel) {
    case 'До 5 лет':
      return {'minAge': 0, 'maxAge': 5};
    case 'От 6 до 8 лет':
      return {'minAge': 6, 'maxAge': 8};
    case 'От 9 до 12 лет':
      return {'minAge': 9, 'maxAge': 12};
    case 'От 13 лет':
    case '13+ лет':
      return {'minAge': 13, 'maxAge': 999};
    default:
      return {'minAge': 0, 'maxAge': 999};
  }
}

// Сервис для построения секций страниц из конфигураций (SectionConfig → HomeSection).
class SectionBuilderService {
  final List<Product> allProducts;
  final List<AppBanner> allBanners;
  final List<Product> recommendations;
  final ProductQueryService queryService;

  SectionBuilderService({
    required this.allProducts,
    required this.allBanners,
    required this.recommendations,
    required this.queryService,
  });

  // Метод построения секций из списка SectionConfig
  List<HomeSection> buildSectionsFromConfig(
    List<SectionConfig> sectionConfigs,
  ) {
    return sectionConfigs.map((config) {
      return HomeSection(
        type: _mapType(config.type),
        title: config.title ?? '',
        subtitle: config.subtitle,
        imageAssetPath: config.imageAssetPath,
        showButton: config.showButton,
        needsTopPadding: config.needsTopPadding,
        products: _resolveProducts(config.dataMethod, config.dataParams),
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

  // Логика связки строк из json с методами сервиса
  List<dynamic> _resolveProducts(
    String? methodName,
    Map<String, dynamic>? params,
  ) {
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
        return queryService
            .getPaidGamesByGenre(allProducts, params?['genre'] ?? '')
            .take(1)
            .toList();

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

      case 'getEbooksByTag':
        return queryService.getEbooksByTag(allProducts, params?['query'] ?? '');

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
}
