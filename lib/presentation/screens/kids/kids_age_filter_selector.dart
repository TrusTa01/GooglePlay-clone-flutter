import 'package:flutter/material.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

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
      context,
      type,
      provider,
      sectionTitle: title,
      subtitle: subtitle,
    );
  }
}
