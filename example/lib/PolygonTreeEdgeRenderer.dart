import 'dart:ui';

import 'package:example/PolygonRenderer.dart';
import 'package:graphview/GraphView.dart';

class PolygonTreeEdgeRenderer extends TreeEdgeRenderer {
  final PolygonRenderer polygonRenderer;

  PolygonTreeEdgeRenderer(
      BuchheimWalkerConfiguration configuration, this.polygonRenderer)
      : super(configuration);

  @override
  void render(Canvas canvas, Graph graph, Paint paint) {
    super.render(canvas, graph, paint);
    polygonRenderer.render(canvas);
  }
}
