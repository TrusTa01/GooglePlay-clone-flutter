import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/di/usecase_providers.dart';
import 'package:google_play/features/banners/domain/entities/event_banner_entity.dart';
import 'package:google_play/core/domain/entities/store_type.dart';
import 'package:google_play/features/events/presentation/viewmodels/product_event_state.dart';
import 'package:google_play/features/events/presentation/viewmodels/ui_mappers/event_section_ui_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/event_hero_banner_mapper.dart';
import 'package:google_play/features/shared/presentation/providers/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_event_view_model.g.dart';

@riverpod
class ProductEventViewModel extends _$ProductEventViewModel {
  @override
  ProductEventState build(String eventId, StoreType storeType) {
    _loadEvent();
    return const ProductEventState(isLoading: true);
  }

  Future<void> _loadEvent() async {
    try {
      final locale =
          ref.read(localeProvider) ?? PlatformDispatcher.instance.locale;
      final AppLocalizations l10n = lookupAppLocalizations(locale);

      // 1. Загружаем банер события
      final bannerRepo = ref.read(bannerRepositoryProvider);
      final banner = await bannerRepo.getBannerById(
        id: eventId,
        locale: locale.languageCode,
      );

      if (banner == null || banner is! EventBannerEntity) {
        state = state.copyWith(isLoading: false, error: 'Event not found');
        return;
      }

      // 2. Загружаем секции для этого события
      // В текущей архитектуре секции события привязаны к категории события
      final eventCategory = banner.eventCategory;
      if (eventCategory == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Event category missing',
        );
        return;
      }

      final getTabSections = ref.read(getTabSectionsUseCaseProvider);
      final sections = await getTabSections(
        storeType: storeType,
        tabKey: eventCategory,
      );

      // 3. Резолвим секции (загружаем данные для каждой секции)
      final resolveSection = ref.read(resolveSectionUseCaseProvider);
      final resolvedSections = await Future.wait(
        sections.map(
          (s) => resolveSection(s, storeType.name, locale.languageCode),
        ),
      );

      // 4. Формируем финальную модель через UseCase (санитизация)
      final buildEventScreen = ref.read(buildEventScreenUseCaseProvider);
      final data = buildEventScreen(banner: banner, sections: resolvedSections);

      // 5. Маппим в UI стейт
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
