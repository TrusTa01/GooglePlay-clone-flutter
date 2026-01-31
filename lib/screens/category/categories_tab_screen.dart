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
    return ListView.builder(
      primary: false,
      itemCount: categories.length - 1,
      itemBuilder: (context, index) {
        return _buildCategoryTile(context, categories[index + 1]);
      },
    );
  }

  Widget _buildCategoryTile(
    BuildContext context,
    ProductCategoriesData category,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: Icon(category.icon, color: category.color),
        title: Text(
          category.title,
          style: const TextStyle(
            fontWeight: Constants.defaultFontWeight,
            fontSize: 15,
          ),
        ),
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
      ),
    );
  }
}
