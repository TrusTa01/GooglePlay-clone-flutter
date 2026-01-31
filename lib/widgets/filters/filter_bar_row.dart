import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class FilterBarRow extends StatelessWidget {
  final String sectionTitle;
  final String subtitle;
  final List<Widget> filters;

  const FilterBarRow({
    super.key,
    required this.filters,
    required this.sectionTitle,
    this.subtitle = '',
  });

  bool get _hasHeader =>
      sectionTitle.trim().isNotEmpty || subtitle.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_hasHeader)
          ProductSectionHeader(
            title: sectionTitle,
            subtitle: subtitle,
            onTap: () {},
            showButton: false,
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  filters
                      .expand((widget) => [widget, const SizedBox(width: 10)])
                      .toList()
                    ..removeLast(),
            ),
          ),
        ),
      ],
    );
  }
}
