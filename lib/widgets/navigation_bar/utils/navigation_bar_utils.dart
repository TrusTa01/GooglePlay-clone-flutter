import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

const TextStyle unselectedLabelStyle = TextStyle(
    color: NavBarConstants.navBarUnselectedLabelColor,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
);

const TextStyle selectedLabelStyle = TextStyle(
    color: NavBarConstants.navBarSelectedLabelColor,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
);

//  Функция, генерирующая NavigationBarThemeData
NavigationBarThemeData buildCustomNavigationBarTheme() {
  return NavigationBarThemeData(
    // Логика стилизации текста
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return selectedLabelStyle;
      }
      return unselectedLabelStyle;
    }),
  );
}
