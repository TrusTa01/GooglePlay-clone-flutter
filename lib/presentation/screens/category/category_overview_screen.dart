import 'package:flutter/material.dart';
import 'package:google_play/domain/entities/products/app_entity.dart';
import 'package:google_play/domain/entities/products/book_entity.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/presentation/screens/screens.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class CategoryOverviewScreen extends StatelessWidget {
  final String title;
  /// L10n key or raw value for the selected category (used for filter state).
  final String categoryKey;
  final List<ProductEntity> products;

  const CategoryOverviewScreen({
    super.key,
    required this.title,
    required this.categoryKey,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final isBooks = products.isNotEmpty && products.first is BookEntity;
    final isApps = products.isNotEmpty && products.first is AppEntity;

    final FilterType filterType = isBooks
        ? FilterType.books
        : isApps
        ? FilterType.apps
        : FilterType.games;

    final FilterProvider filterProvider = isBooks
        ? FilterProvider.forCategoryOverview(initialBookGenre: categoryKey)
        : isApps
        ? FilterProvider.forCategoryOverview(initialAppCategory: categoryKey)
        : FilterProvider.forCategoryOverview(initialGameCategory: categoryKey);

    return Scaffold(
      body: ChangeNotifierProvider<FilterProvider>(
        create: (_) => filterProvider,
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SimpleSliverAppBar(
                    showBackButton: true,
                    showLogo: false,
                    onLeadingPressed: () => Navigator.pop(context),
                    title: AppBarTitle(title: title),
                  ),
                  ...TopChartsScreen.asSliver(
                    context,
                    type: filterType,
                    showFilters: false,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
