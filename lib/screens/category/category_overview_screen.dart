import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/screens/screens.dart';
import '../../widgets/widgets.dart';
import '../../models/models.dart';

class CategoryOverviewScreen extends StatelessWidget {
  final String title;
  final List<Product> products;

  const CategoryOverviewScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final isBooks = products.isNotEmpty && products.first is Book;
    final isApps = products.isNotEmpty && products.first is App;

    final FilterType filterType = isBooks
        ? FilterType.books
        : isApps
        ? FilterType.apps
        : FilterType.games;

    final FilterProvider filterProvider = isBooks
        ? FilterProvider.forCategoryOverview(initialBookGenre: title)
        : isApps
        ? FilterProvider.forCategoryOverview(initialAppCategory: title)
        : FilterProvider.forCategoryOverview(initialGameCategory: title);

    return Scaffold(
      body: ChangeNotifierProvider<FilterProvider>(
        create: (_) => filterProvider,
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  onLeadingPressed: () => Navigator.pop(context),
                  title: AppBarTitle(title: title),
                ),
                ...TopChartsScreen.buildSlivers(
                  context,
                  type: filterType,
                  showFilters: false,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
