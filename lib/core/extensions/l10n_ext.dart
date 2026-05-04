import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';

extension LocalizedContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
