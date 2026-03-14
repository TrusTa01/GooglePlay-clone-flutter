import 'package:flutter/widgets.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

void shareProduct(BuildContext context, String title, String url) {
  final l10n = AppLocalizations.of(context);
  final message = l10n.shareMessage(title, url);
  SharePlus.instance.share(ShareParams(text: message));
}
