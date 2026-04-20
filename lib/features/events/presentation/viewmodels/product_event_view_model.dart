import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/banners/di/di.dart';
import 'package:google_play/features/banners/domain/entities/banner_kind.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/events/di/di.dart';
import 'package:google_play/features/events/presentation/viewmodels/product_event_state.dart';
import 'package:google_play/features/sections/di/di.dart';
import 'package:google_play/features/events/presentation/viewmodels/ui_mappers/event_section_ui_mapper.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_mappers/event_hero_banner_mapper.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_event_view_model.g.dart';

@riverpod
class ProductEventViewModel extends _$ProductEventViewModel {
  @override
  ProductEventState build(String eventId, ProductKind productKind) {
    final locale =
        ref.watch(localeProvider) ?? PlatformDispatcher.instance.locale;
    _loadEvent(locale);
    return const ProductEventState(isLoading: true);
  }

  Future<void> _loadEvent(Locale locale) async {
    try {
      final AppLocalizations l10n = lookupAppLocalizations(locale);

      final getBannerById = ref.read(getBannerByIdUseCaseProvider);
      final banner = await getBannerById(
        id: eventId,
        type: BannerKind.event,
        locale: locale.languageCode,
      );

      if (banner == null || banner is! EventBannerEntity) {
        state = state.copyWith(isLoading: false, error: 'Event not found');
        return;
      }

      final eventCategory = banner.eventCategory;
      if (eventCategory == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Event category missing',
        );
        return;
      }

      final resolvedSectionsUseCase = ref.read(resolvedSectionsUseCaseProvider);
      final resolvedSections = await resolvedSectionsUseCase(
        productKind: productKind,
        tabId: eventCategory,
        locale: locale.languageCode,
      );

      final buildEventScreen = ref.read(buildEventScreenUseCaseProvider);
      final data = buildEventScreen(banner: banner, sections: resolvedSections);

      const heroMapper = EventHeroBannerMapper();
      const sectionMapper = EventSectionUiMapper();

      final hero = heroMapper.fromEntity(data.banner);
      final mappedSections = data.sections
          .map(
            (section) =>
                sectionMapper.map(section: section, l10n: l10n, locale: locale),
          )
          .toList(growable: false);

      state = ProductEventState(
        isLoading: false,
        heroModel: hero,
        description: data.banner.eventDescription ?? '',
        sections: mappedSections,
      );
    } catch (error, stackTrace) {
      debugPrint('Error loading event: $error\n$stackTrace');
      state = state.copyWith(isLoading: false, error: error);
    }
  }
}
