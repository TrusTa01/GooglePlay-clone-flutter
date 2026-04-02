enum ProductNetworkViews {
  games('games_full_view'),
  apps('apps_full_view'),
  books('books_full_view');

  final String name;
  const ProductNetworkViews(this.name);
}