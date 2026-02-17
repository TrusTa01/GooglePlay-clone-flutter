import 'package:flutter/material.dart';

class TabsProvider extends ValueNotifier {
  TabsProvider() : super([]);

  List<String> get tabs => value;

  void setTabs(List<String> newTabs) => value = newTabs;
}
