import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class FilterBar extends StatelessWidget {
  final String sectionTitle;
  final String subtitle;
  final List<Widget> filters;

  const FilterBar({
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
            padding: const EdgeInsets.symmetric(horizontal: 22),
            onTap: () {},
            showButton: false,
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
              child: Row(
                children:
                    filters
                        .expand((widget) => [widget, const SizedBox(width: 10)])
                        .toList()
                      ..removeLast(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
