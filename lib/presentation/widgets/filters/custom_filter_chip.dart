import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class CustomFilterChip extends StatelessWidget {
  final bool hasOptions;
  final String label;
  final VoidCallback onSelected;
  final bool isSelected;

  const CustomFilterChip({
    super.key,
    this.hasOptions = false,
    required this.label,
    required this.onSelected,
    this.isSelected = false,
  });
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (hasOptions)
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: isSelected
                  ? Constants.uiSelectedIconColor
                  : Colors.black,
            ),
        ],
      ),
      showCheckmark: isSelected,
      selected: isSelected,
      selectedColor: Constants.uiSelectionBackgroundColor,
      backgroundColor: isSelected
          ? Constants.uiSelectionBackgroundColor
          : Colors.white,
      checkmarkColor: Constants.uiSelectedIconColor,
      labelStyle: TextStyle(
        color: isSelected
            ? Constants.uiSelectedIconColor
            : Colors.black,
        fontWeight: Constants.defaultFontWeight,
      ),
      side: BorderSide(
        color: isSelected ? Colors.transparent : Colors.grey.shade400,
      ),
      visualDensity: VisualDensity.comfortable,
      onSelected: (_) => onSelected(),
    );
  }
}
