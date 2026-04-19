enum ProductKind {
  game('game'),
  app('app'),
  book('book');

  final String name;
  const ProductKind(this.name);

  String getKind(ProductKind kind) => switch (kind) {
    ProductKind.game => 'game',
    ProductKind.app => 'app',
    ProductKind.book => 'book',
  };
}
