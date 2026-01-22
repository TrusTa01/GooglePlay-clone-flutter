import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/providers.dart';
import '/widgets/widgets.dart';

class KidsAgeFilterSelector extends StatelessWidget {
  final FilterType type;
  final String title;
  final String subtitle;

  const KidsAgeFilterSelector({
    super.key,
    required this.type,
    this.title = '',
    this.subtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FilterProvider>();

    return FilterSets.getFilters(
      type,
      provider,
      sectionTitle: title,
      subtitle: subtitle,
    );
  }
}
