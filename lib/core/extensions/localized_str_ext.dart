extension LocalizedStringX on Map<String, String> {
  String display(String locale) =>
      this[locale] ?? this['en'] ?? (values.isNotEmpty ? values.first : '');
}
