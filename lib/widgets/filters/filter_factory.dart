import 'package:flutter/material.dart';

import '/screens/screens.dart';
import '../../providers/providers.dart';
import '/widgets/widgets.dart';

enum FilterType { games, apps, books, kidsAge }

class FilterSets {
  static Widget getFilters(
    FilterType type,
    ProductsProvider provider, {
    String sectionTitle = '',
    String subtitle = '',
  }) {
    List<Widget> activeFilters = [];

    switch (type) {
      case FilterType.games:
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: provider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => provider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: gamesCategoriesData,
            currentSelection: provider.selectedGameCategory,
            onSelected: (val) => provider.updateGameCategory(val),
          ),
          const RecentFilter(),
        ];
        break;

      case FilterType.apps:
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: provider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => provider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: appsCategoriesData,
            currentSelection: provider.selectedAppCategory,
            onSelected: (val) => provider.updateAppCategory(val),
          ),
        ];
        break;

      case FilterType.books:
        activeFilters = [
          TopFilter(
            defaultTitle: 'Топ Бесплатных',
            currentSelection: provider.selectedTopFilter,
            options: topFilterOptions,
            onSelected: (val) => provider.setTopFilter(val),
          ),
          CategoryFilter(
            defaultTitle: 'Категории',
            options: gamesCategoriesData,
            currentSelection: provider.selectedGameCategory,
            onSelected: (val) => provider.updateGameCategory(val),
          ),
          const RecentFilter(),
        ];
        break;

      case FilterType.kidsAge:
        activeFilters = provider.selectedKidsFilters
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
