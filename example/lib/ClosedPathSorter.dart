import 'dart:math';

import 'package:graphview/GraphView.dart';

class ClosedPathSorter {
  Point _getCenter(List<Node> nodes) {
    double x = 0, y = 0;
    for (var i = 0; i < nodes.length; i++) {
      x += nodes[i].x;
      y += nodes[i].y;
    }
    return Point(x / nodes.length, y / nodes.length);
  }

  void sort(List<Node> nodes) {
    Point center = _getCenter(nodes);
    Map<Node, double> angles = Map();
    nodes.sort((a, b) {
      if (!angles.containsKey(a)) {
        angles[a] = _calculateAngle(Point(a.x, a.y), center);
      }
      if (!angles.containsKey(b)) {
        angles[b] = _calculateAngle(Point(b.x, b.y), center);
      }
      return angles[a]!.compareTo(angles[b]!);
    });
  }

  double _calculateAngle(Point a, Point b) {
    return atan2(b.y - a.y, b.x - a.x) * 180 / pi;
  }
}
