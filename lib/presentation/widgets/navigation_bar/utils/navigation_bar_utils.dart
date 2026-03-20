import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';

const TextStyle unselectedLabelStyle = TextStyle(
  color: Constants.uiUnselectedColor,
  fontSize: 12.0,
  fontWeight: Constants.defaultFontWeight,
);

const TextStyle selectedLabelStyle = TextStyle(
  color: Constants.uiSelectedLabelColor,
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
