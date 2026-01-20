import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

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
                  ? NavBarConstants.navBarSelectedIconColor
                  : Colors.black,
            ),
        ],
      ),
      showCheckmark: isSelected,
      selected: isSelected,
      selectedColor: NavBarConstants.navBarIndicatorColor,
      backgroundColor: isSelected
          ? NavBarConstants.navBarIndicatorColor
          : Colors.white,
      checkmarkColor: NavBarConstants.navBarSelectedIconColor,
      labelStyle: TextStyle(
        color: isSelected
            ? NavBarConstants.navBarSelectedIconColor
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
