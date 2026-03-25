import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/features/category/presentation/screens/product_categories_data.dart';
import 'package:google_play/features/filters/presentation/viewmodels/filter_provider.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum FilterType { games, apps, books, kidsAge }

class FilterSets {
  static Widget getFilters(
    BuildContext context,
    WidgetRef ref,
    FilterType type, {
    String sectionTitle = '',
    String subtitle = '',
    ValueChanged<String>? onKidsAgeTap,
  }) {
    final state = ref.watch(filterProvider);
    final notifier = ref.read(filterProvider.notifier);

    final l10n = context.l10n;
    List<Widget> activeFilters = [];

    switch (type) {
      case FilterType.games:
        if (state.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: gamesCategoriesData,
              currentSelection: state.selectedGameCategory,
              onSelected: (val) => notifier.updateGameCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterTopFreeOption,
              modalTitle: l10n.filterTopCharts,
              currentSelection: state.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => notifier.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: gamesCategoriesData,
              currentSelection: state.selectedGameCategory,
              onSelected: (val) => notifier.updateGameCategory(val),
            ),
            ToggleFilter(
              label: lookupL10n(l10n, state.selectedRecentFilter),
              isSelected: state.isFilterOnlyMode,
              onSelected: notifier.toggleFilterOnly,
            ),
          ];
        }
        break;

      case FilterType.apps:
        if (state.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: appsCategoriesData,
              currentSelection: state.selectedAppCategory,
              onSelected: (val) => notifier.updateAppCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterTopFreeOption,
              modalTitle: l10n.filterTopCharts,
              currentSelection: state.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => notifier.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: appsCategoriesData,
              currentSelection: state.selectedAppCategory,
              onSelected: (val) => notifier.updateAppCategory(val),
            ),
          ];
        }
        break;

      case FilterType.kidsAge:
        activeFilters = state.selectedKidsFilters
            .map(
              (ageKey) {
                final ageLabel = lookupL10n(l10n, ageKey);
                return ToggleFilter(
                  label: ageLabel,
                  isSelected: false,
                  onSelected: () => onKidsAgeTap?.call(ageLabel),
                );
              },
            )
            .toList();
        break;

      case FilterType.books:
        if (state.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterGenre,
              defaultTitle: l10n.filterGenre,
              options: booksGenresData,
              currentSelection: state.selectedBookGenre,
              onSelected: (val) => notifier.updateBookGenre(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterGenre,
              defaultTitle: l10n.filterGenre,
              options: booksGenresData,
              currentSelection: state.selectedBookGenre,
              onSelected: (val) => notifier.updateBookGenre(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterAge,
              modalTitle: l10n.filterAge,
              options: ageFilterData,
              currentSelection: state.selectedAgeFilter,
              onSelected: (val) => notifier.setAgeFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterByRating,
              modalTitle: l10n.filterByRating,
              options: byRating,
              currentSelection: state.selectedRatingFilter,
              onSelected: (val) => notifier.setRatingFilter(val),
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterLanguage,
              defaultTitle: l10n.filterLanguage,
              options: languagesData,
              currentSelection: state.selectedLanguageFilter,
              onSelected: (val) => notifier.setLanguageFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterAbridged,
              modalTitle: l10n.filterAbridged,
              options: abridgetVersion,
              currentSelection: state.selectedAbridgetVersionFilter,
              onSelected: (val) => notifier.setAbridgedVersionFilter(val),
            ),
          ];
        }
        break;
    }

    return FilterBarRow(
      filters: activeFilters,
      sectionTitle: sectionTitle,
      subtitle: subtitle,
    );
  }
}
