import '/models/models.dart';
import '/providers/providers.dart';

class PageBuilder {
  final ProductsProvider provider;

  PageBuilder(this.provider);

  // Рекомендуемые игры
  List<HomeSection> buildGamesRecommendedPage() {
    return [
      HomeSection(
        type: SectionType.banners,
        title: '',
        showButton: false,
        products: provider.getBannersByPrefix('g_'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Специально для вас',
        products: provider.recommendations,
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Играют все',
        subtitle: 'Попробуйте и вы!',
        products: provider.getGamesByCategory('Казино'),
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Рекомендуем',
        products: provider.recommendations.reversed.toList(),
      ),
      HomeSection(
        type: SectionType.banners,
        title: 'Специально для вас',
        showButton: false,
        products: provider.getBannersByPrefix('g_'),
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Экшен-игры',
        products: provider.getGamesByCategory('Экшен'),
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Настольные игры',
        products: provider.getGamesByCategory('Настольные'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Файтинги',
        products: provider.getGamesByCategory('Файтинг'),
      ),
    ];
  }

  // Платные игры
  List<HomeSection> buildGamesPaidPage() {
    final allPaid = provider.allProducts
        .whereType<Game>()
        .where((g) => g.isPaid)
        .toList();

    return [
      HomeSection(
        type: SectionType.preview,
        title: 'Необычные головоломки',
        // Берем 1 платную игру из жанра головоломки
        products: provider.getPaidGamesByGenre('Головоломки').take(1).toList(),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Сыграйте перед покупкой',
        subtitle: 'Пробуйте сейчас, платите позже',
        products: allPaid.take(10).toList(),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Игры по низким ценам',
        products: allPaid.where((g) => (g.price ?? 0) < 150).toList(),
      ),
      HomeSection(
        type: SectionType.banners,
        title: '',
        showButton: false,
        products: provider.getBannersByPrefix('g_'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Лучшие инди игры',
        products: provider.getProductsByTag('Инди'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Офлайн-игры',
        products: provider.getOfflineGames(),
      ),
    ];
  }

  // Детям
  List<HomeSection> buildKidsPage() {
    return [
      HomeSection(
        type: SectionType.kidsHeroBanner,
        needsTopPadding: false,
        title: 'Одобрено преподавателями',
        subtitle: 'Проверенное качество',
        imageAssetPath: 'assets/images/kids_tab/kids_tab_image2.webp',
      ),
      HomeSection(
        type: SectionType.ageFIlterSelector,
        title: 'Выберите возраст',
        needsTopPadding: false,
        products: [], // Чипы возраста создаются в FilterSets
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Математические игры',
        products: provider.getProductsByTag('Математика'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Рисование',
        products: provider.getProductsByTag('Рисование'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Для всей семьи',
        products: provider.getProductsByTag('Для всей семьи'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Обучающие игры',
        products: provider.getGamesByCategory('Обучающие'),
      ),
    ];
  }

  List<HomeSection> buildKidsCategoryPage(String ageLabel) {
    final ageRange = provider.getAgeRangeFromLabel(ageLabel);
    final minAge = ageRange['minAge']!;
    final maxAge = ageRange['maxAge']!;
    
    final ageFilteredProducts = provider.getKidsAgeFilteredProducts(minAge, maxAge);
    final mathProducts = provider.getProductsByTag('Математика');
    final combinedProducts = <Product>{...ageFilteredProducts, ...mathProducts}.toList();

    return [
      HomeSection(
        type: SectionType.kidsHeroBanner,
        needsTopPadding: false,
        title: 'Одобрено преподавателями',
        subtitle: 'Проверенное качество',
        imageAssetPath: 'assets/images/kids_tab/kids_tab_image2.webp',
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Игры для $ageLabel и Математические игры',
        products: combinedProducts,
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Рисование',
        products: provider.getProductsByTag('Рисование'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Для всей семьи',
        products: provider.getProductsByTag('Для всей семьи'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Обучающие игры',
        products: provider.getGamesByCategory('Обучающие'),
      ),
    ];
  }
}
