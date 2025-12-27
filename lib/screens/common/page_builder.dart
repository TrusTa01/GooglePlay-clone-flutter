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
        showButton: false,
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
      HomeSection(
        type: SectionType.banners,
        title: 'dsdssdds',
        showButton: true,
        items: provider.getBannersByPrefix('g_'),
      ),
      HomeSection(
        type: SectionType.preview, 
        title: '', 
        items: provider.getGamesByCategory('Файтинг')
      ),
    ];
  }
}
