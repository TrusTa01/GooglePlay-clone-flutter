import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/widgets/widgets.dart';

class TopFilter extends StatelessWidget {
  const TopFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductsProvider>();

    return CustomFilterChip(
      hasOptions: true,
      label: provider.selectedTopFilter,
      isSelected: true,
      onSelected: () => SelectionModal.show(
        context: context,
        title: 'Лучшее',
        options: provider.topFilterOptions,
        activeOption: provider.selectedTopFilter,
        onSelect: (value) => provider.setTopFilter(value),
      ),
    );
  }
}
