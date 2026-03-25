enum StoreType { games, apps, books }

extension StoreTypeKey on StoreType {
  String get categoryKey => switch (this) {
    StoreType.apps => 'app',
    StoreType.games => 'game',
    StoreType.books => 'book',
  };
}
