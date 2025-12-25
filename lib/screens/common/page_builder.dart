import '/models/section_model.dart';
import '/providers/providers.dart';

class PageBuilder {
  final ProductsProvider provider;

  PageBuilder(this.provider);

  // Сборка вкладки "Игры"
  List<HomeSection> buildGamesRecommendedPage() {
    return [
      HomeSection(
        type: SectionType.banners,
        title: '',
        items: provider.getBannersByPrefix('g_'),
      ),
      HomeSection(
        type: SectionType.carousel,
        title: 'Рекомендуем',
        items: provider.recommendations,
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Файтинги',
        items: provider.getGamesByCategory('Файтинг'),
      ),
    ];
  }

  // // Сборка вкладки "Детям"
  // List<HomeSection> buildKidsPage() {
  //   return [
  //     HomeSection(
  //       type: SectionType.grid,
  //       title: 'Для самых маленьких',
  //       items: provider.getGamesByCategory('Образовательные'),
  //     ),
  //     HomeSection(
  //       type: SectionType.banners,
  //       title: '',
  //       items: provider.getBannersByPrefix('k_'),
  //     ),
  //     HomeSection(
  //       type: SectionType.carousel,
  //       title: 'Популярные мультики',
  //       items: provider.getGamesByCategory('Мультфильмы'),
  //     ),
  //   ];
  // }
}
