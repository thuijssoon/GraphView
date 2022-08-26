import 'dart:ui';

import 'Polygon.dart';

class PolygonRenderer {
  final List<Polygon> _polygons;

  final Path _path = Path();
  final Paint _strokePaint = Paint()..style = PaintingStyle.stroke;
  final Paint _fillPaint = Paint()..style = PaintingStyle.fill;

  PolygonRenderer(this._polygons);

  void render(Canvas canvas) {
    for (var i = 0; i < _polygons.length; i++) {
      _renderPolygon(_polygons[i], canvas);
    }
  }

  void _renderPolygon(Polygon polygon, Canvas canvas) {
    _path.reset();

    _path.moveTo(polygon.nodes.first.x + polygon.nodes.first.width / 2,
        polygon.nodes.first.y + polygon.nodes.first.height / 2);
    for (var i = 1; i < polygon.nodes.length; i++) {
      _path.lineTo(polygon.nodes[i].x + polygon.nodes[i].width / 2,
          polygon.nodes[i].y + polygon.nodes[i].height / 2);
    }
    _path.close();

    _fillPaint.color = polygon.fillColor;
    _strokePaint.color = polygon.strokeColor;
    _strokePaint.strokeWidth = polygon.strokeWidth;

    // Draw stroke on top of fill
    canvas.drawPath(_path, _fillPaint);
    canvas.drawPath(_path, _strokePaint);
  }
}
