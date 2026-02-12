import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SliverConstraints;
import 'package:google_play/core/constants.dart';
import 'package:google_play/models/models.dart';
import 'package:google_play/screens/screens.dart';

class CategoriesTabScreen extends StatelessWidget {
  final List<ProductCategoriesData> categories;
  final List<Product> products;
  final bool isSliver;

  const CategoriesTabScreen({
    super.key,
    required this.categories,
    required this.products,
    this.isSliver = false,
  });

  static Widget asSliver({
    required List<ProductCategoriesData> categories,
    required List<Product> products,
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
                  title: category.title,
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
                    category.title,
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
