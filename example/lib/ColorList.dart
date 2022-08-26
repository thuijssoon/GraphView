import 'dart:ui';

import 'package:flutter/material.dart';

class ColorList {
  final List<int> colorHex;
  int _index = -1;

  ColorList(this.colorHex);

  Color getCurrent() {
    if (-1 == _index) {
      throw Exception('No current color selected');
    }
    return Color(colorHex[_index]);
  }

  Color getNext() {
    if (_index == colorHex.length - 1) {
      _index = -1;
    }
    _index += 1;
    return Color(colorHex[_index]);
  }
}
