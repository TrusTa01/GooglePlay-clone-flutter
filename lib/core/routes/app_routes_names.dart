abstract final class AppRouterNames {
  // Общие
  static const String games = '/games';
  static const String apps = '/apps';
  static const String search = '/search';
  static const String books = '/books';

  // Скриншоты
  static const String image = '/image';

  // Экраны продукта
  static const String productScreen = 'product/:productId';
  static const String productDetails = 'details';
  static const String productPermissions = 'permissions';
  static const String productAboutAuthor = 'author';

  // События (банера)
  static const String eventsScreen = 'events';

  // Категории
  static const String categoriesOverview = 'category/:categoryKey';

  // Детям
  static const String kidsDetailsScreen = 'kids/info';
  static const String kidsAgeCategoryScreen = 'kids/:ageKey';

  // Секция 'еще'
  static const String sectionMore = 'section/:categoryKey';
}
