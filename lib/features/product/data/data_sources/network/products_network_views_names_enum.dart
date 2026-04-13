enum NetworkProductsViewsNames {
  games('games_full_view'),
  apps('apps_full_view'),
  books('books_full_view');

  final String name;
  const NetworkProductsViewsNames(this.name);

  static NetworkProductsViewsNames? getViewName(String? type) => switch (type) {
    'game' => NetworkProductsViewsNames.games,
    'app' => NetworkProductsViewsNames.apps,
    'book' => NetworkProductsViewsNames.books,
    _ => null,
  };
}
