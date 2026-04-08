enum NetworkProductViewsNames {
  games('games_full_view'),
  apps('apps_full_view'),
  books('books_full_view');

  final String name;
  const NetworkProductViewsNames(this.name);

  static NetworkProductViewsNames? getViewName(String? type) => switch (type) {
    'game' => NetworkProductViewsNames.games,
    'app' => NetworkProductViewsNames.apps,
    'book' => NetworkProductViewsNames.books,
    _ => null,
  };
}
