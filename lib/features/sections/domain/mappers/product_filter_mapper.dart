import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';

extension ProductFilterMapper on ProductFilter {
  static ProductFilter fromRaw(String type, dynamic value) {
    final key = type.toLowerCase();

    return switch (key) {
      'category' || 'genre' => CategoryFilter(genre: value?.toString() ?? ''),
      'tag' => TagFilter(tag: value?.toString() ?? ''),
      'is_paid' || 'paid' => IsPaidFilter(isPaid: _parseBool(value)),
      'age' ||
      'age_limit' ||
      'agerating' => AgeLimitFilter(age: _parseInt(value)),
      _ => const UnknownFilter(),
    };
  }

  static bool _parseBool(dynamic v) {
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return s == 'true' || s == '1';
  }

  static int _parseInt(dynamic v) =>
      v is int ? v : int.tryParse(v.toString()) ?? 0;
}
