import 'dart:convert';

// Локализованная строка: ключи локали (`en`, `ru`, …)
typedef LocalizedString = Map<String, String>;

/// Чтение JSON-полей для [ProductDto] из ответов Supabase (map, JSON-string, списки)
final class ProductDtoJsonConverters {
  const ProductDtoJsonConverters._();

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
