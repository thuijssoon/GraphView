import 'dart:math';

import 'package:example/ColorGenerator.dart';
import 'package:example/ColorList.dart';
import 'package:example/Polygon.dart';
import 'package:example/PolygonBuchheimWalkerAlgorithm.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import 'ClosedPathSorter.dart';

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.siblingSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: 'Sibling Separation'),
                    onChanged: (text) {
                      builder.siblingSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.levelSeparation.toString(),
                    decoration: InputDecoration(labelText: 'Level Separation'),
                    onChanged: (text) {
                      builder.levelSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.subtreeSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: 'Subtree separation'),
                    onChanged: (text) {
                      builder.subtreeSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.orientation.toString(),
                    decoration: InputDecoration(labelText: 'Orientation'),
                    onChanged: (text) {
                      builder.orientation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < 10; i++) {
                      final node = Node.Id(graph.nodeCount() + 1);
                      var edge =
                          graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                      print(edge);
                      graph.addEdge(edge, node);
                    }
                    setState(() {});
                  },
                  child: Text('Add nodes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int total = r.nextInt(3) + 3; // Groups between 3 and 6
                    List<Node> nodes = [];
                    String id = '';
                    for (int i = 0; i < total; i++) {
                      final node =
                          graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                      nodes.add(node);
                      id += node.key.toString() + '-';
                    }
                    polygons.add(Polygon(
                      nodes: nodes,
                      strokeColor: colorGenerator.get(id),
                      fillColor: colorGenerator.get(id).withOpacity(0.60),
                    ));
                    setState(() {});
                  },
                  child: Text('Add polygon'),
                )
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphView(
                    graph: graph,
                    // algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                    algorithm: PolygonBuchheimWalkerAlgorithm(
                      configuration: builder,
                      polygons: polygons,
                      sorter: ClosedPathSorter(),
                    ),
                    paint: Paint()
                      ..color = Colors.green
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    builder: (Node node) {
                      // I can decide what widget should be shown here based on the id
                      var a = node.key!.value as int?;
                      return rectangleWidget(a);
                    },
                  )),
            ),
          ],
        ));
  }

  Random r = Random();

  Widget rectangleWidget(int? a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }

  final Graph graph = Graph()..isTree = true;
  final List<Polygon> polygons = [];
  // Kelly's colors: https://eleanormaclure.files.wordpress.com/2011/03/colour-coding.pdf
  final ColorGenerator colorGenerator = ColorGenerator(
    colorList: ColorList([
      0xFFFFB300,
      0xFF803E75,
      0xFFFF6800,
      0xFFA6BDD7,
      0xFFC10020,
      0xFFCEA262,
      0xFF817066,
      0xFF007D34,
      0xFFF6768E,
      0xFF00538A,
      0xFFFF7A5C,
      0xFF53377A,
      0xFFFF8E00,
      0xFFB32851,
      0xFFF4C800,
      0xFF7F180D,
      0xFF93AA00,
      0xFF593315,
      0xFFF13A13,
      0xFF232C16,
    ]),
    maximumCacheSize: 100,
  );
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node7 = Node.Id(7);
    final node8 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node.Id(10);
    final node11 = Node.Id(11);
    final node12 = Node.Id(12);
    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    graph.addEdge(node11, node12);

    Color color1 = colorGenerator.get('2-6-1-10-4');
    Color color2 = colorGenerator.get('2-3-7');
    Color color3 = colorGenerator.get('1-3-12');
    Color color4 = colorGenerator.get('6-9-7');
    Color color5 = colorGenerator.get('4-10-11');
    polygons.add(Polygon(
      nodes: [node2, node6, node1, node10, node4],
      strokeColor: color1,
      fillColor: color1.withOpacity(0.60),
    ));
    polygons.add(Polygon(
      nodes: [node2, node3, node7],
      strokeColor: color2,
      fillColor: color2.withOpacity(0.60),
    ));
    polygons.add(Polygon(
      nodes: [node1, node3, node12],
      strokeColor: color3,
      fillColor: color3.withOpacity(0.60),
    ));
    polygons.add(Polygon(
      nodes: [node6, node9, node8],
      strokeColor: color4,
      fillColor: color4.withOpacity(0.60),
    ));
    polygons.add(Polygon(
      nodes: [node4, node10, node11],
      strokeColor: color5,
      fillColor: color5.withOpacity(0.60),
    ));

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
