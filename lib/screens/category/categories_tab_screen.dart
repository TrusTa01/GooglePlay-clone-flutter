import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '/screens/screens.dart';

class CategoriesTabScreen extends StatelessWidget {
  final List<ProductCategories> categories;

  const CategoriesTabScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categories
          .map((category) => _buildCategoryTile(context, category))
          .toList(),
    );
  }
  
  Widget _buildCategoryTile(BuildContext context, ProductCategories category) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
     child: ListTile(
      leading: Icon(category.icon, color: category.color),
      title: Text(
        category.title,
        style: const TextStyle(fontWeight: Constants.defaultFontWeight, fontSize: 15),
      ),
      onTap: (){
        debugPrint('Переход к категории: ${category.title}');
      },
     ),
    );
  }
}
