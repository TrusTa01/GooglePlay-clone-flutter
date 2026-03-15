import 'package:flutter/material.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/presentation/screens/category/product_categories_data.dart';
import 'package:google_play/presentation/screens/kids_screen/kids_age_category_screen.dart';
import 'package:google_play/presentation/viewmodels/filter_provider.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

enum FilterType { games, apps, books, kidsAge }

class FilterSets {
  static Widget getFilters(
    BuildContext context,
    FilterType type,
    FilterProvider filterProvider, {
    String sectionTitle = '',
    String subtitle = '',
  }) {
    final l10n = context.l10n;
    List<Widget> activeFilters = [];

    switch (type) {
      case FilterType.games:
        if (filterProvider.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: gamesCategoriesData,
              currentSelection: filterProvider.selectedGameCategory,
              onSelected: (val) => filterProvider.updateGameCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterTopFreeOption,
              modalTitle: l10n.filterTopCharts,
              currentSelection: filterProvider.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => filterProvider.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: gamesCategoriesData,
              currentSelection: filterProvider.selectedGameCategory,
              onSelected: (val) => filterProvider.updateGameCategory(val),
            ),
            ToggleFilter(
              label: lookupL10n(l10n, filterProvider.selectedRecentFilter),
              isSelected: filterProvider.isFilterOnlyMode,
              onSelected: filterProvider.toggleFilterOnly,
            ),
          ];
        }
        break;

      case FilterType.apps:
        if (filterProvider.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: appsCategoriesData,
              currentSelection: filterProvider.selectedAppCategory,
              onSelected: (val) => filterProvider.updateAppCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterTopFreeOption,
              modalTitle: l10n.filterTopCharts,
              currentSelection: filterProvider.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => filterProvider.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterCategories,
              defaultTitle: l10n.filterCategories,
              options: appsCategoriesData,
              currentSelection: filterProvider.selectedAppCategory,
              onSelected: (val) => filterProvider.updateAppCategory(val),
            ),
          ];
        }
        break;

      case FilterType.kidsAge:
        activeFilters = filterProvider.selectedKidsFilters
            .map(
              (ageKey) => Builder(
                builder: (ctx) {
                  final ageLabel = lookupL10n(l10n, ageKey);
                  return ToggleFilter(
                    label: ageLabel,
                    isSelected: false,
                    onSelected: () => Navigator.of(ctx).push(
                      MaterialPageRoute(
                        builder: (_) => KidsAgeCategoryScreen(
                          ageLabel: ageLabel,
                          sections: const [],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            .toList();
        break;

      case FilterType.books:
        if (filterProvider.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterGenre,
              defaultTitle: l10n.filterGenre,
              options: booksGenresData,
              currentSelection: filterProvider.selectedBookGenre,
              onSelected: (val) => filterProvider.updateBookGenre(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterGenre,
              defaultTitle: l10n.filterGenre,
              options: booksGenresData,
              currentSelection: filterProvider.selectedBookGenre,
              onSelected: (val) => filterProvider.updateBookGenre(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterAge,
              modalTitle: l10n.filterAge,
              options: ageFilterData,
              currentSelection: filterProvider.selectedAgeFilter,
              onSelected: (val) => filterProvider.setAgeFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterByRating,
              modalTitle: l10n.filterByRating,
              options: byRating,
              currentSelection: filterProvider.selectedRatingFilter,
              onSelected: (val) => filterProvider.setRatingFilter(val),
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: l10n.filterLanguage,
              defaultTitle: l10n.filterLanguage,
              options: languagesData,
              currentSelection: filterProvider.selectedLanguageFilter,
              onSelected: (val) => filterProvider.setLanguageFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: l10n.filterAbridged,
              modalTitle: l10n.filterAbridged,
              options: abridgetVersion,
              currentSelection: filterProvider.selectedAbridgetVersionFilter,
              onSelected: (val) => filterProvider.setAbridgedVersionFilter(val),
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
