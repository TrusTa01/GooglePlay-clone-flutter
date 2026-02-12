import 'package:flutter/material.dart';
import 'package:google_play/widgets/widgets.dart';

class ToggleFilter extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const ToggleFilter({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilterChip(
      label: label, 
      isSelected: isSelected,
      onSelected: onSelected,
    );
  }
}
