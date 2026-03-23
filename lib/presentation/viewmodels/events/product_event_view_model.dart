import 'dart:ui';

import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/domain/entities/banners/simple_banner_entity.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/viewmodels/events/product_event_state.dart';
import 'package:google_play/presentation/viewmodels/events/ui_mappers/event_section_ui_mapper.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/event_hero_banner_mapper.dart';
import 'package:google_play/presentation/viewmodels/providers/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_event_view_model.g.dart';

class ProductEventArgs {
  final SimpleBannerEntity eventBanner;
  final List<ResolvedSection> sections;

  const ProductEventArgs({
    required this.eventBanner,
    required this.sections,
  });
}

@riverpod
ProductEventState productEventViewModel(Ref ref, ProductEventArgs args) {
  try {
    final locale =
        ref.read(localeProvider) ?? PlatformDispatcher.instance.locale;
    final AppLocalizations l10n = lookupAppLocalizations(locale);

    final useCase = ref.watch(buildEventScreenUseCaseProvider);
    const heroMapper = EventHeroBannerMapper();
    const sectionMapper = EventSectionUiMapper();

    final data = useCase(banner: args.eventBanner, sections: args.sections);
    final hero = heroMapper.fromEntity(data.banner);
    final mappedSections = data.sections
        .map(
          (section) => sectionMapper.map(
            section: section,
            l10n: l10n,
            locale: locale,
          ),
        )
        .toList(growable: false);

    return ProductEventState(
      isLoading: false,
      heroModel: hero,
      description: data.banner.eventDescription ?? '',
      sections: mappedSections,
    );
  } catch (error) {
    return ProductEventState(isLoading: false, error: error);
  }
}
