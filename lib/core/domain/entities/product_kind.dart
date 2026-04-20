enum ProductKind {
  game('game'),
  app('app'),
  book('book');

  final String name;
  const ProductKind(this.name);

  String get rawValue => name;

  static ProductKind fromString(String value) {
    return ProductKind.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => ProductKind.game,
    );
  }
}
