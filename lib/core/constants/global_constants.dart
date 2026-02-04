import 'package:flutter/material.dart';

abstract class Constants {
  // Основной цвет
  static const Color googleBlue = Color(0xFF0B57CE);

  // Основной цвет текста
  static const Color defautTextColor = Color(0xFF4D4F4E);

  // Остновная жирность шрифта
  static const FontWeight defaultFontWeight = FontWeight.w600;

  // Основная тень
  static const Color boxShadow = Color.fromRGBO(0, 0, 0, 0.25);

  // Задний фон контейнера рейтинга и цены
  static const Color ratingBackgroungColor = Color(0xFFF0F4F9);

  // Для виджета InkWell
  static final BorderRadius cardRadius = BorderRadius.circular(12);

  static const EdgeInsets horizontalContentPadding = EdgeInsets.symmetric(
    horizontal: 22,
  );

  // Константы для расчёта maxContentWidth слайдеров
  static const double sliderCardWidth = 115;
  static const double sliderCardMargin = 12;
  static const int sliderMaxVisibleItems = 8;
  static const double sliderMaxContentWidth = 1040;
}
