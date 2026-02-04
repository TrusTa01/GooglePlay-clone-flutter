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
          Center(
            child: ProductSectionHeader(
              title: sectionTitle,
              subtitle: subtitle,
              padding: const EdgeInsets.only(top: 10),
              onTap: () {},
              showButton: false,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: Constants.horizontalContentPadding.copyWith(top: 8),
              child: Row(
                children: filters.isEmpty
                    ? []
                    : (filters
                        .expand((widget) => [widget, const SizedBox(width: 10)])
                        .toList()
                      ..removeLast()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
