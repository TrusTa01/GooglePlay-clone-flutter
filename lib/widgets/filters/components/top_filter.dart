import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/screens/category/product_categories_data.dart';

class TopFilter extends StatelessWidget {
  final String defaultTitle;
  final List<ProductCategoriesData> options;
  final String currentSelection;
  final Function(String) onSelected;

  const TopFilter({
    super.key,
    required this.defaultTitle,
    required this.options,
    required this.currentSelection,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilterChip(
      hasOptions: true,
      label: currentSelection == 'Топ Бесплатных'
          ? defaultTitle
          : currentSelection,
      isSelected: true,
      onSelected: () => SelectionModal.show(
        context: context,
        title: 'Лучшее',
        options: topFilterOptions,
        activeOption: currentSelection,
        onSelect: (val) => onSelected(val),
      ),
    );
  }
}
