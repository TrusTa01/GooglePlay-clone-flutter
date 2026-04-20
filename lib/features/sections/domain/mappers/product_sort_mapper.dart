import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';

extension ProductSortMapper on ProductSort {
  static ProductSort? fromRaw(String? sort) {
    if (sort == null) return null;

    final s = sort.toLowerCase();

    return switch (s) {
      'popular' => const Popular(),
      'top_rated' || 'toprated' => const TopRated(),
      'new' || 'new_release' || 'newrelease' => const NewRelease(),
      'last_updated' || 'lastupdated' || 'updated' => const LastUpdated(),
      _ => null,
    };
  }
}
