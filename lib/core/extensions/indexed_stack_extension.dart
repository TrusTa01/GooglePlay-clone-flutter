import 'package:flutter/material.dart';

extension MapIndexed on List<Widget> {
  List<Widget> mapIndexed(Widget Function(int index, Widget item) builder) {
    return asMap().entries.map((e) => builder(e.key, e.value)).toList();
  }
}
