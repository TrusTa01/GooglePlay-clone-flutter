import 'package:flutter/material.dart';

class AppBarConstants {
  // Пути и базовые настройки
  static const defaultLogoAssetPath = 'assets/images/google_play_logo.png';
  static const defaultElevation = 0.0;

  // Цвета
  static const defaultBackgroundColor = Colors.white;

  /// tabAppBar
  static const tabBarIndicatorColor = Color(0xFF0958CF);
  static const tabBarLabelColor = Color(0xFF0958CF);
  static const tabBarUnselectedLabelColor = Color(0xFF4D4F4E);

  /// SearchAppBar
  static const seachInput = Color.fromARGB(255, 232, 239, 246);
  static const searchLabelColor = Color(0xFF4D4F4E);

  // Размеры
  static const tabBarIndicatorWeight = 4.0;
  static const tabBarHeight = 120.0;

  // Стили
  // SearchAppBar
  static final searchAppBarBoxDecoration = BoxDecoration(
    color: AppBarConstants.seachInput,
    borderRadius: BorderRadius.circular(30),
  );
}
