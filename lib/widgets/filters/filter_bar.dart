import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final List<Widget> filters;

  const FilterBar({
    super.key, 
    required this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Row(
            children: filters.expand((widget) => [
              widget,
              const SizedBox(width: 10,)
            ]).toList()..removeLast(),
          ),
        ),
      ),
    );
  }
}
