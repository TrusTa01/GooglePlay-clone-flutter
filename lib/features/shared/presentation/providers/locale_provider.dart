import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const _kAppLocaleKey = 'app_locale';

@Riverpod(keepAlive: true)
@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final code = prefs.getString(_kAppLocaleKey);
    if (code == null || code.isEmpty) return null;
    return Locale(code);
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_kAppLocaleKey, locale.languageCode);
    state = locale;
  }

  Future<void> clearLocale() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_kAppLocaleKey);
    state = null;
  }
}
