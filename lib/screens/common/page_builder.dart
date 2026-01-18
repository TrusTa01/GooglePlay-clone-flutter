import '/models/section_model.dart';
import '/providers/providers.dart';

class PageBuilder {
  final ProductsProvider provider;

  PageBuilder(this.provider);

  // Сборка Страницы "Игры"
  // Сборка вкладки 'Рекомендуем'
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
        title: 'Рекомендуем',
        products: provider.recommendations,
      ),
      HomeSection(
        type: SectionType.grid,
        title: 'Казино',
        products: provider.getGamesByCategory('Казино'),
      ),
      // HomeSection(
      //   type: SectionType.banners,
      //   title: 'dsdssdds',
      //   showButton: true,
      //   products: provider.getBannersByPrefix('g_'),
      // ),
      HomeSection(
        type: SectionType.preview, 
        title: '', 
        products: provider.getGamesByCategory('Казино')
      ),
    ];
  }
}
