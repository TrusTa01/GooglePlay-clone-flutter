import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/screens/category/product_categories_data.dart';

class CategoryFilter extends StatelessWidget {
  final String defaultTitle;
  final List<ProductCategoriesData> options;
  final String currentSelection;
  final Function(String) onSelected;

  const CategoryFilter({
    super.key,
    required this.defaultTitle,
    required this.options,
    required this.currentSelection,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilterChip(
      label: currentSelection == 'Все категории'
          ? defaultTitle
          : currentSelection,
      hasOptions: true,
      isSelected: currentSelection != 'Все категории',
      onSelected: () => SelectionModal.showFullscreen(
        context: context,
        title: defaultTitle,
        options: options,
        activeOption: currentSelection,
        onSelect: (val) => onSelected(val),
      ),
    );
  }
}
