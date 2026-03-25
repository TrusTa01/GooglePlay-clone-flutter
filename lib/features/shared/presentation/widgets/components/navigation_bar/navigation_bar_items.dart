import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';

List<NavigationDestination> buildNavDestinations(BuildContext context) => [
      NavigationDestination(
        icon: Image.asset(
          'assets/icons/nav_bar_icons/gamepad_outlined.png',
          color: Constants.uiUnselectedColor,
          width: 20,
          height: 20,
        ),
        selectedIcon: Image.asset(
          'assets/icons/nav_bar_icons/gamepad.png',
          color: Constants.uiSelectedIconColor,
          width: 20,
          height: 20,
        ),
        label: context.l10n.navGames,
      ),
      NavigationDestination(
        icon: Image.asset(
          'assets/icons/nav_bar_icons/app_outlined.png',
          color: Constants.uiUnselectedColor,
          width: 16,
          height: 16,
        ),
        selectedIcon: Image.asset(
          'assets/icons/nav_bar_icons/app.png',
          color: Constants.uiSelectedIconColor,
          width: 16,
          height: 16,
        ),
        label: context.l10n.navApps,
      ),
      NavigationDestination(
        icon: Icon(
          Icons.search,
          color: Constants.uiUnselectedColor,
        ),
        selectedIcon: Icon(
          Icons.search,
          color: Constants.uiSelectedIconColor,
        ),
        label: context.l10n.navSearch,
      ),
      NavigationDestination(
        icon: Icon(
          Icons.book_outlined,
          color: Constants.uiUnselectedColor,
        ),
        selectedIcon: Icon(
          Icons.book,
          color: Constants.uiSelectedIconColor,
        ),
        label: context.l10n.navBooks,
      ),
    ];
