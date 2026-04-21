import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';

extension ProductFilterMapper on ProductFilter {
  static ProductFilter fromRaw(String type, dynamic value) {
    final key = type.toLowerCase();
    final raw = value?.toString().trim();

    return switch (key) {
      'category' || 'genre' => _toCategoryFilter(raw),
      'tag' => _toTagFilter(raw),
      'is_paid' || 'paid' => IsPaidFilter(isPaid: _parseBool(value)),
      'age' || 'age_limit' || 'agerating' => _toAgeFilter(value),
      _ => const UnknownFilter(),
    };
  }

  static ProductFilter _toCategoryFilter(String? value) {
    if (value == null || value.isEmpty) return const UnknownFilter();
    return CategoryFilter(genre: value);
  }

  static ProductFilter _toTagFilter(String? value) {
    if (value == null || value.isEmpty) return const UnknownFilter();
    return TagFilter(tag: value);
  }

  static ProductFilter _toAgeFilter(dynamic value) {
    final age = _parseInt(value);
    if (age <= 0) return const UnknownFilter();
    return AgeLimitFilter(age: age);
  }

  static bool _parseBool(dynamic v) {
    if (v is bool) return v;
    final s = v.toString().toLowerCase();
    return s == 'true' || s == '1';
  }

  static int _parseInt(dynamic v) =>
      v is int ? v : int.tryParse(v.toString()) ?? 0;
}
