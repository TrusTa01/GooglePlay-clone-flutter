import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';

extension LocalizedContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Возвращает локализованную строку по ключу из конфига (например title_key / subtitle_key секции).
  /// Ключи добавляются в .arb; после изменений запустите flutter gen-l10n и dart run tools/generate_l10n_lookup.dart.
  String l10nKey(String? key) =>
      key == null || key.isEmpty ? '' : lookupL10n(l10n, key);
}
