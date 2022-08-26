import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class Polygon {
  final List<Node> nodes;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  Polygon({
    required this.nodes,
    this.strokeWidth = 2,
    this.strokeColor = const Color(0xff2196f3),
    this.fillColor = const Color(0xb32196f3),
  });
}
