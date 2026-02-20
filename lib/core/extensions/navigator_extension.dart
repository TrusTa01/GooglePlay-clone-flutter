import 'package:flutter/material.dart';

extension NavigatorListExtension on List<GlobalKey<NavigatorState>> {
  Widget createNavigator(int index, Widget initialScreen) {
    return Navigator(
      key: this[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => initialScreen);
      },
    );
  }
}
