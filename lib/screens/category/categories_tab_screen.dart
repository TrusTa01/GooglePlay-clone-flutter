import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '/screens/screens.dart';

class CategoriesTabScreen extends StatelessWidget {
  final List<ProductCategoriesData> categories;
  final List<Product> products;

  const CategoriesTabScreen({
    super.key,
    required this.categories,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double minItemWidth = 260;
        int crossAxisCount = (constraints.maxWidth / minItemWidth).floor();
        crossAxisCount = crossAxisCount.clamp(1, 3);

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Constants.sliderMaxContentWidth,
            ),
            child: GridView.builder(
              primary: false,
              padding: Constants.horizontalContentPadding.copyWith(
                top: 20,
                bottom: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 56,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
              ),
              itemCount: categories.length - 1,
              itemBuilder: (context, index) {
                return _buildCategoryTile(context, categories[index + 1]);
              },
            ),
          ),
        );
      },
    );
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
