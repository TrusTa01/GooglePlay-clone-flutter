import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

// Games
List<NavigationDestination> destinations = [
  NavigationDestination(
    icon: Image.asset(
      'assets/icons/nav_bar_icons/gamepad_outlined.png',
      color: NavBarConstants.navBarUnselectedLabelColor,
      width: 20,
      height: 20,
    ),
    selectedIcon: Image.asset(
      'assets/icons/nav_bar_icons/gamepad.png',
      color: NavBarConstants.navBarSelectedIconColor,
      width: 20,
      height: 20,
    ),
    label: 'Игры',
  ),
  // Apps
  NavigationDestination(
    icon: Image.asset(
      'assets/icons/nav_bar_icons/app_outlined.png',
      color: NavBarConstants.navBarUnselectedLabelColor,
      width: 16,
      height: 16,
    ),
    selectedIcon: Image.asset(
      'assets/icons/nav_bar_icons/app.png',
      color: NavBarConstants.navBarSelectedIconColor,
      width: 16,
      height: 16,
    ),
    label: 'Приложения',
  ),
  // Search
  NavigationDestination(
    icon: Icon(Icons.search, color: NavBarConstants.navBarUnselectedLabelColor),
    selectedIcon: Icon(
      Icons.search,
      color: NavBarConstants.navBarSelectedIconColor,
    ),
    label: 'Поиск',
  ),
  // Books
  NavigationDestination(
    icon: Icon(
      Icons.book_outlined,
      color: NavBarConstants.navBarUnselectedLabelColor,
    ),
    selectedIcon: Icon(
      Icons.book,
      color: NavBarConstants.navBarSelectedIconColor,
    ),
    label: 'Книги',
  ),
];
