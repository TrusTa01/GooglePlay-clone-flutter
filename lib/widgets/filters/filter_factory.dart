import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_play/providers/providers.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/services/product_query_service.dart';
import 'package:google_play/services/section_builder_service.dart';
import 'package:google_play/widgets/widgets.dart';

enum FilterType { games, apps, books, kidsAge }

class FilterSets {
  static Widget getFilters(
    FilterType type,
    FilterProvider filterProvider, {
    String sectionTitle = '',
    String subtitle = '',
  }) {
    List<Widget> activeFilters = [];

    switch (type) {
      case FilterType.games:
        if (filterProvider.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Категории',
              defaultTitle: 'Категории',
              options: gamesCategoriesData,
              currentSelection: filterProvider.selectedGameCategory,
              onSelected: (val) => filterProvider.updateGameCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: 'Топ бесплатных',
              modalTitle: 'Лучшее',
              currentSelection: filterProvider.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => filterProvider.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Категории',
              defaultTitle: 'Категории',
              options: gamesCategoriesData,
              currentSelection: filterProvider.selectedGameCategory,
              onSelected: (val) => filterProvider.updateGameCategory(val),
            ),
            ToggleFilter(
              label: filterProvider.selectedRecentFilter,
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
              modalTitle: 'Категории',
              defaultTitle: 'Категории',
              options: appsCategoriesData,
              currentSelection: filterProvider.selectedAppCategory,
              onSelected: (val) => filterProvider.updateAppCategory(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: false,
              defaultTitle: 'Топ бесплатных',
              modalTitle: 'Лучшее',
              currentSelection: filterProvider.selectedTopFilter,
              options: topFilterOptions,
              onSelected: (val) => filterProvider.setTopFilter(val),
              highlightDefault: true,
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Категории',
              defaultTitle: 'Категории',
              options: appsCategoriesData,
              currentSelection: filterProvider.selectedAppCategory,
              onSelected: (val) => filterProvider.updateAppCategory(val),
            ),
          ];
        }
        break;

      case FilterType.kidsAge:
        activeFilters = filterProvider.selectedKidsFilters
            .map((age) => Builder(
                  builder: (context) {
                    final productsProvider = context.read<ProductsProvider>();
                    final sectionBuilder = SectionBuilderService(
                      allProducts: productsProvider.allProducts,
                      allBanners: productsProvider.allBanners,
                      recommendations: productsProvider.recommendations,
                      pageConfigs: productsProvider.pageConfigs,
                      queryService: ProductQueryService(),
                    );
                    final sections = sectionBuilder.buildKidsCategoryPage(age);
                    
                    return ToggleFilter(
                      label: age,
                      isSelected: false,
                      onSelected: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => KidsAgeCategoryScreen(
                            ageLabel: age,
                            sections: sections,
                          ),
                        ),
                      ),
                    );
                  },
                ))
            .toList();
        break;

      case FilterType.books:
        if (filterProvider.isCategoryOverviewMode) {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Жанр',
              defaultTitle: 'Жанр',
              options: booksGenresData,
              currentSelection: filterProvider.selectedBookGenre,
              onSelected: (val) => filterProvider.updateBookGenre(val),
            ),
          ];
        } else {
          activeFilters = [
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Жанр',
              defaultTitle: 'Жанр',
              options: booksGenresData,
              currentSelection: filterProvider.selectedBookGenre,
              onSelected: (val) => filterProvider.updateBookGenre(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: 'Возраст',
              modalTitle: 'Возраст',
              options: ageFilterData,
              currentSelection: filterProvider.selectedAgeFilter,
              onSelected: (val) => filterProvider.setAgeFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: 'По рейтингу',
              modalTitle: 'По рейтингу',
              options: byRating,
              currentSelection: filterProvider.selectedRatingFilter,
              onSelected: (val) => filterProvider.setRatingFilter(val),
            ),
            ModalFilter(
              isFullScreen: true,
              modalTitle: 'Язык',
              defaultTitle: 'Язык',
              options: languagesData,
              currentSelection: filterProvider.selectedLanguageFilter,
              onSelected: (val) => filterProvider.setLanguageFilter(val),
            ),
            ModalFilter(
              isFullScreen: false,
              defaultTitle: 'Сокращенное издание',
              modalTitle: 'Сокращенное издание',
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
