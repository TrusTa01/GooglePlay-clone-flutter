import 'dart:ui';

import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/sections/domain/usecases/resolve_section_usecase.dart';
import 'package:google_play/features/events/presentation/viewmodels/ui_models/event_section_ui_model.dart';
import 'package:google_play/features/sections/presentation/viewmodels/ui_mappers/section_payload_mapper.dart';

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
      title:
          section.config.title?[locale.languageCode] ??
          section.config.title?['en'] ??
          '',
      subtitle:
          section.config.subtitle?[locale.languageCode] ??
          section.config.subtitle?['en'] ??
          '',
      payload: payload,
    );
  }
}
