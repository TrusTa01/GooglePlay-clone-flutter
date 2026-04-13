abstract final class SortOrders {
  static const ({String column, bool ascending}) sortOrderAsc = (
    column: 'sort_order',
    ascending: true,
  );

  static const ({String column, bool ascending}) releaseDateDesc = (
    column: 'release_date',
    ascending: false,
  );
}
