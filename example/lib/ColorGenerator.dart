import 'dart:ui';

import 'package:example/ColorList.dart';
import 'package:quiver/collection.dart';

class ColorGenerator {
  late final LruMap<String, Color> _cache;
  late final ColorList _colorList;

  ColorGenerator(
      {required ColorList colorList, required int maximumCacheSize}) {
    _colorList = colorList;
    _cache = LruMap(maximumSize: maximumCacheSize);
  }

  Color get(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }
    Color color = _colorList.getNext();
    _cache[id] = color;
    return color;
  }
}
