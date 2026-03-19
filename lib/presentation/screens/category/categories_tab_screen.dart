import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/l10n/gen/l10n_lookup.dart';
import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/presentation/screens/screens.dart';

class CategoriesTabScreen extends StatelessWidget {
  final List<ProductCategoriesData> categories;
  final List<ProductEntity> products;
  final bool isSliver;

  const CategoriesTabScreen({
    super.key,
    required this.categories,
    required this.products,
    this.isSliver = false,
  });

  static Widget asSliver({
    required List<ProductCategoriesData> categories,
    required List<ProductEntity> products,
  }) {
    return CategoriesTabScreen(
      categories: categories,
      products: products,
      isSliver: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final double fullWidth = constraints.crossAxisExtent;
        final double maxWidth = Constants.sliderMaxContentWidth;

        final double horizontalPadding = fullWidth > maxWidth
            ? (fullWidth - maxWidth) / 2
            : 22;

        final int crossAxisCount = _calculateAxisCount(fullWidth);

        if (isSliver) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 22,
            ),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 56,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
              ),
              itemCount: categories.length - 1,
              itemBuilder: (context, index) =>
                  _buildCategoryTile(context, categories[index + 1]),
            ),
          );
        }

        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Constants.sliderMaxContentWidth,
                ),
                child: GridView.builder(
                  primary: false,
                  padding: EdgeInsets.all(22),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisExtent: 56,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: categories.length - 1,
                  itemBuilder: (context, index) =>
                      _buildCategoryTile(context, categories[index + 1]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  int _calculateAxisCount(double width) {
    const double minItemWidth = 260;
    final double contentWidth = width.clamp(
      0.0,
      Constants.sliderMaxContentWidth,
    );
    return (contentWidth / minItemWidth).floor().clamp(1, 3);
  }

  Widget _buildCategoryTile(
    BuildContext context,
    ProductCategoriesData category,
  ) {
    final l10n = context.l10n;
    final displayTitle = category.titleL10nKey != null
        ? lookupL10n(l10n, category.titleL10nKey!)
        : (category.title ?? '');
    return Padding(
      padding: Constants.horizontalContentPadding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryOverviewScreen(
                  title: displayTitle,
                  categoryKey: category.value,
                  products: products,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const SizedBox(width: 15),
                Icon(category.icon, color: category.color),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    displayTitle,
                    style: const TextStyle(
                      fontWeight: Constants.defaultFontWeight,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
