import 'dart:convert';
import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) =>
      (json.decode(fromDb) as List).cast<String>();

  @override
  String toSql(List<String> value) => json.encode(value);
}

class StringListNullableConverter
    extends TypeConverter<List<String>?, String?> {
  const StringListNullableConverter();

  @override
  List<String>? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    final decoded = json.decode(fromDb);
    if (decoded is! List) return null;
    return decoded.map((e) => e.toString()).toList();
  }

  @override
  String? toSql(List<String>? value) =>
      value == null ? null : json.encode(value);
}

class MapConverter extends TypeConverter<Map<String, dynamic>, String> {
  const MapConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      json.decode(fromDb) as Map<String, dynamic>;

  @override
  String toSql(Map<String, dynamic> value) => json.encode(value);
}

class LocalizedStringConverter
    extends TypeConverter<Map<String, String>, String> {
  const LocalizedStringConverter();

  @override
  Map<String, String> fromSql(String fromDb) =>
      Map<String, String>.from(json.decode(fromDb) as Map);

  @override
  String toSql(Map<String, String> value) => json.encode(value);
}

class LocalizedStringNullableConverter
    extends TypeConverter<Map<String, String>?, String?> {
  const LocalizedStringNullableConverter();

  @override
  Map<String, String>? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    return Map<String, String>.from(json.decode(fromDb) as Map);
  }

  @override
  String? toSql(Map<String, String>? value) =>
      value == null || value.isEmpty ? null : json.encode(value);
}

class LocalizedStringListConverter
    extends TypeConverter<List<Map<String, String>>, String> {
  const LocalizedStringListConverter();

  @override
  List<Map<String, String>> fromSql(String fromDb) {
    final list = json.decode(fromDb) as List;
    return list
        .map(
          (e) => Map<String, String>.from(
            (e as Map).map((k, v) => MapEntry(k.toString(), v.toString())),
          ),
        )
        .toList();
  }

  @override
  String toSql(List<Map<String, String>> value) => json.encode(value);
}

class LocalizedStringListNullableConverter
    extends TypeConverter<List<Map<String, String>>?, String?> {
  const LocalizedStringListNullableConverter();

  @override
  List<Map<String, String>>? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    final list = json.decode(fromDb) as List;
    return list
        .map(
          (e) => Map<String, String>.from(
            (e as Map).map((k, v) => MapEntry(k.toString(), v.toString())),
          ),
        )
        .toList();
  }

  @override
  String? toSql(List<Map<String, String>>? value) =>
      value == null ? null : json.encode(value);
}
