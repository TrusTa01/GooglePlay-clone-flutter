import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class TabsProvider extends ChangeNotifier {
  List<String> _tabs = [];

  List<String> get tabs => _tabs;

  void setTabs(List<String> newTabs) {
    if (_tabs != newTabs) {
      _tabs = newTabs;
      notifyListeners();
    }
  }
}