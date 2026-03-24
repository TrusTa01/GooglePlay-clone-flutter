import 'package:flutter/material.dart';
import 'package:google_play/core/routes/app_routes_names.dart';

abstract final class Constants {
  // Основной цвет
  static const Color googleBlue = Color(0xFF0B57CE);

  // Основной цвет текста
  static const Color defaultTextColor = Color(0xFF4D4F4E);

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

  // Индекс вкладки нижней навигации при старте приложения
  // 0 = игры, 1 = приложения, 2 = поиск, 3 = книги
  static const int defaultBottomNavIndex = 0;
  static const String initialLocation = AppRouterNames.games;

  // Простой способ вертикального отступа между блоками
  static const divider15 = SizedBox(height: 15);
  static const divider20 = SizedBox(height: 20);
  static const divider25 = SizedBox(height: 25);

  // Простой способ вертикального отступа между блоками (сливерная версия)
  static const sliverDivider15 = SliverToBoxAdapter(
    child: SizedBox(height: 15),
  );
  static const sliverDivider20 = SliverToBoxAdapter(
    child: SizedBox(height: 20),
  );
  static const sliverDivider25 = SliverToBoxAdapter(
    child: SizedBox(height: 25),
  );

  static const baseDataPath = 'assets/data/';
  static const baseConfigPath = 'assets/config/';

  // Общая палитра выбора
  static const Color uiUnselectedColor = Color(0xFF4D4F4E);
  static const Color uiSelectedLabelColor = Color(0xFF2076A7);
  static const Color uiSelectedIconColor = Color(0xFF004A75);
  static const Color uiSelectionBackgroundColor = Color(0xFFC3E7FF);
}
