import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/filter_provider.dart';
import '/widgets/widgets.dart';

class RecentFilter extends StatelessWidget {
  const RecentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = context.watch<FilterProvider>();

    return CustomFilterChip(
      label: filterProvider.selectedRecentFilter,
      isSelected: filterProvider.isRecentFilterActive,
      onSelected: filterProvider.toggleRecentOnly,
    );
  }
}
