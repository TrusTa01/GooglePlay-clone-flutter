import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

const TextStyle unselectedLabelStyle = TextStyle(
  color: NavBarConstants.navBarUnselectedLabelColor,
  fontSize: 12.0,
  fontWeight: Constants.defaultFontWeight,
);

const TextStyle selectedLabelStyle = TextStyle(
  color: NavBarConstants.navBarSelectedLabelColor,
  fontSize: 12.0,
  fontWeight: Constants.defaultFontWeight,
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
