import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '/widgets/widgets.dart';
import '/providers/providers.dart';

class KidsAgeFilter extends StatelessWidget {
  final String label;

  const KidsAgeFilter({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductsProvider>();
    final sections = PageBuilder(provider).buildKidsCategoryPage(label);

    return CustomFilterChip(
      label: label,
      onSelected: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(
        builder: (context) => KidsAgeCategoryScreen(
          ageLabel: label,
          sections: sections,
        ),
      )),
    );
  }
}
