import 'dart:ui';

import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/viewmodels/events/ui_models/event_section_ui_model.dart';
import 'package:google_play/presentation/viewmodels/sections/ui_mappers/section_payload_mapper.dart';

class EventSectionUiMapper {
  const EventSectionUiMapper();

  EventSectionUiModel map({
    required ResolvedSection section,
    required AppLocalizations l10n,
    required Locale locale,
  }) {
    final payload = SectionPayloadMapper().map(
      config: section.config,
      items: section.items,
      l10n: l10n,
      locale: locale,
    );

    return EventSectionUiModel(
      id: section.config.id,
      title: _lookupKey(l10n, section.config.titleKey),
      subtitle: _lookupKey(l10n, section.config.subtitleKey),
      payload: payload,
    );
  }

  String _lookupKey(AppLocalizations l10n, String? key) {
    if (key == null || key.isEmpty) return '';
    return lookupL10n(l10n, key);
  }
}
