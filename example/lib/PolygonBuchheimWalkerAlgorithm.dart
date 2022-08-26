import 'dart:ui';

import 'package:example/PolygonRenderer.dart';
import 'package:example/PolygonTreeEdgeRenderer.dart';
import 'package:graphview/GraphView.dart';

import 'ClosedPathSorter.dart';
import 'Polygon.dart';

class PolygonBuchheimWalkerAlgorithm extends BuchheimWalkerAlgorithm {
  final List<Polygon> polygons;
  final ClosedPathSorter sorter;

  PolygonBuchheimWalkerAlgorithm({
    required BuchheimWalkerConfiguration configuration,
    required this.polygons,
    required this.sorter,
  }) : super(
            configuration,
            PolygonTreeEdgeRenderer(
              configuration,
              PolygonRenderer(polygons),
            ));

  @override
  Size run(Graph? graph, double shiftX, double shiftY) {
    Size size = super.run(graph, shiftX, shiftY);
    for (var i = 0; i < polygons.length; i++) {
      sorter.sort(polygons[i].nodes);
    }
    return size;
  }
}
