import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:google_play/presentation/screens/category/categories_tab_screen.dart';
import 'package:google_play/presentation/screens/category/product_categories_data.dart';
import 'package:google_play/presentation/screens/charts_screens/top_charts_screen.dart';
import 'package:google_play/presentation/widgets/filters/filter_factory.dart';
import 'package:google_play/presentation/screens/common/lazy_tab_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<Widget> buildStoreTabSlivers({
  required BuildContext context,
  required String tabKey,
  required List<ProductEntity> products,
  required AsyncValue<List<SectionEntity>> sectionsState,
}) {
  return switch (tabKey) {
    'games_top_charts' => TopChartsScreen.asSliver(
      context,
      type: FilterType.games,
      showFilters: true,
    ),
    'games_categories' => [
      CategoriesTabScreen.asSliver(
        categories: gamesCategoriesData,
        products: products,
      ),
    ],
    'apps_top_charts' => TopChartsScreen.asSliver(
      context,
      type: FilterType.apps,
      showFilters: true,
    ),
    'apps_categories' => [
      CategoriesTabScreen.asSliver(
        categories: appsCategoriesData,
        products: products,
      ),
    ],
    'books_top_sales' ||
    'books_new_releases' ||
    'books_top_free' => TopChartsScreen.asSliver(
      context,
      type: FilterType.books,
      showFilters: true,
    ),
    'books_genres' => [
      CategoriesTabScreen.asSliver(
        categories: booksGenresData,
        products: products,
      ),
    ],
    _ => [LazyTabContent(sectionState: sectionState, isSliver: true)],
  };
}
