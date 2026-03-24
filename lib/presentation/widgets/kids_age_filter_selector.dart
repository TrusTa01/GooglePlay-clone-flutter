import 'package:flutter/material.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KidsAgeFilterSelector extends ConsumerWidget {
  final FilterType type;
  final String title;
  final String subtitle;
  final ValueChanged<String>? onKidsAgeTap;

  const KidsAgeFilterSelector({
    super.key,
    required this.type,
    this.title = '',
    this.subtitle = '',
    this.onKidsAgeTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterSets.getFilters(
      context,
      ref,
      type,
      sectionTitle: title,
      subtitle: subtitle,
      onKidsAgeTap: onKidsAgeTap,
    );
  }
}
