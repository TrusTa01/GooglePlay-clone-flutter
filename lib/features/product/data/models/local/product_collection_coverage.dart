final class ProductCollectionCoverage {
  final int lastLoadedPage;
  final bool hasReachedEnd;

  const ProductCollectionCoverage({
    required this.lastLoadedPage,
    required this.hasReachedEnd,
  });

  factory ProductCollectionCoverage.fromCursor(String? raw) {
    if (raw == null || raw.isEmpty) {
      return const ProductCollectionCoverage(
        lastLoadedPage: 0,
        hasReachedEnd: false,
      );
    }

    final values = <String, String>{};
    for (final part in raw.split(';')) {
      final separatorIndex = part.indexOf('=');
      if (separatorIndex <= 0 || separatorIndex >= part.length - 1) continue;
      final key = part.substring(0, separatorIndex).trim();
      final value = part.substring(separatorIndex + 1).trim();
      values[key] = value;
    }

    final page = int.tryParse(values['page'] ?? '') ?? 0;
    final end = values['end'] == '1';
    return ProductCollectionCoverage(lastLoadedPage: page, hasReachedEnd: end);
  }

  String toCursor() => 'page=$lastLoadedPage;end=${hasReachedEnd ? 1 : 0}';

  ProductCollectionCoverage mergeLoadedPage({
    required int page,
    required int pageSize,
    required int loadedItemsCount,
  }) {
    var nextLastLoadedPage = lastLoadedPage;
    if (lastLoadedPage == 0 && page == 1) {
      nextLastLoadedPage = 1;
    } else if (page == lastLoadedPage + 1) {
      nextLastLoadedPage = page;
    } else if (page <= lastLoadedPage) {
      nextLastLoadedPage = lastLoadedPage;
    }

    final reachedEndOnContiguousRange =
        loadedItemsCount < pageSize && page == nextLastLoadedPage;

    return ProductCollectionCoverage(
      lastLoadedPage: nextLastLoadedPage,
      hasReachedEnd: hasReachedEnd || reachedEndOnContiguousRange,
    );
  }
}
