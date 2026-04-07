import 'dart:convert';

// Локализованная строка: ключи локали (`en`, `ru`, …)
typedef LocalizedString = Map<String, String>;

/// Чтение JSON-полей для [ProductDto] из ответов Supabase (map, JSON-string, списки)
final class ProductDtoJsonConverters {
  const ProductDtoJsonConverters._();
  static Map<String, int> ratingDistributionFromJson(Object? value) {
    if (value == null) return const <String, int>{};

    if (value is Map) {
      return value.map(
        (key, v) => MapEntry(key.toString(), (v as num).toInt()),
      );
    }

    if (value is String) {
      if (value.trim().isEmpty) return const <String, int>{};
      final decoded = jsonDecode(value);
      if (decoded is Map) {
        return decoded.map(
          (key, v) => MapEntry(key.toString(), (v as num).toInt()),
        );
      }
    }

    throw FormatException(
      'Invalid ratingDistribution JSON: ${value.runtimeType}',
    );
  }

  static List<Map<String, dynamic>> topReviewsFromJson(Object? value) {
    if (value == null) return const <Map<String, dynamic>>[];

    if (value is List) {
      return value.map((e) {
        if (e is Map) return Map<String, dynamic>.from(e);
        throw FormatException(
          'Invalid topReviews element type: ${e.runtimeType}',
        );
      }).toList();
    }

    if (value is String) {
      if (value.trim().isEmpty) return const <Map<String, dynamic>>[];
      final decoded = jsonDecode(value);
      if (decoded is List) {
        return decoded.map((e) {
          if (e is Map) return Map<String, dynamic>.from(e);
          throw FormatException(
            'Invalid topReviews element type: ${e.runtimeType}',
          );
        }).toList();
      }
    }

    throw FormatException('Invalid topReviews JSON: ${value.runtimeType}');
  }

  static LocalizedString localizedStringFromJson(Object? value) {
    if (value == null) return const <String, String>{};

    if (value is Map) {
      return Map<String, String>.from(
        value.map((k, v) => MapEntry(k.toString(), v.toString())),
      );
    }

    if (value is String) {
      final decoded = jsonDecode(value);
      if (decoded is Map) {
        return Map<String, String>.from(
          decoded.map((k, v) => MapEntry(k.toString(), v.toString())),
        );
      }
    }

    throw FormatException('Invalid LocalizedString JSON: ${value.runtimeType}');
  }

  static LocalizedString? localizedStringNullableFromJson(Object? value) {
    if (value == null) return null;
    final m = localizedStringFromJson(value);
    return m.isEmpty ? null : m;
  }

  static List<LocalizedString> localizedStringListFromJson(Object? value) {
    if (value == null) return const <LocalizedString>[];
    final list = value as List;
    return list.map(localizedStringFromJson).toList();
  }

  static List<String> stringListFromJson(Object? value) {
    if (value == null) return const <String>[];
    final list = value as List;
    return list.map((e) => e.toString()).toList();
  }
}
