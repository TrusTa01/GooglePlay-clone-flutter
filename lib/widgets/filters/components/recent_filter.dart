import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/widgets/widgets.dart';

class RecentFilter extends StatelessWidget {
  const RecentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductsProvider>();

    return CustomFilterChip(
      label: provider.selectedRecentFilter,
      isSelected: provider.isRecentFilterActive,
      onSelected: provider.toggleRecentOnly,
    );
  }
}
