import 'package:flutter/material.dart';

import '/screens/screens.dart';
import '../../providers/filter_provider.dart';
import '/widgets/widgets.dart';

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
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: filterProvider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => filterProvider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: gamesCategoriesData,
            currentSelection: filterProvider.selectedGameCategory,
            onSelected: (val) => filterProvider.updateGameCategory(val),
          ),
          const RecentFilter(),
        ];
        break;

      case FilterType.apps:
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: filterProvider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => filterProvider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: appsCategoriesData,
            currentSelection: filterProvider.selectedAppCategory,
            onSelected: (val) => filterProvider.updateAppCategory(val),
          ),
        ];
        break;

      case FilterType.books:
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: filterProvider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => filterProvider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: gamesCategoriesData,
            currentSelection: filterProvider.selectedGameCategory,
            onSelected: (val) => filterProvider.updateGameCategory(val),
          ),
          const RecentFilter(),
        ];
        break;

      case FilterType.kidsAge:
        activeFilters = filterProvider.selectedKidsFilters
            .map((age) => KidsAgeFilter(label: age))
            .toList();
        break;
    }

    return FilterBar(
      filters: activeFilters,
      sectionTitle: sectionTitle,
      subtitle: subtitle,
    );
  }
}
