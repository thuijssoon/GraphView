import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/BuchheimWalkerAlgorithm.dart';
import 'package:graphview/Graph.dart';
import 'package:graphview/GraphView.dart';
import 'package:graphview/TreeEdgeRenderer.dart';

class GraphViewPage extends StatefulWidget {
  @override
  _GraphViewPageState createState() => _GraphViewPageState();
}

class _GraphViewPageState extends State<GraphViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.siblingSeparation.toString(),
                    decoration: InputDecoration(labelText: "Sibling Sepration"),
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
                    decoration: InputDecoration(labelText: "Level Seperation"),
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
                    decoration: InputDecoration(labelText: "Subtree separation"),
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
                    decoration: InputDecoration(labelText: "Orientation"),
                    onChanged: (text) {
                      builder.orientation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    final Node node12 = Node(getNodeText());
                    var edge = graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                    print(edge);
                    graph.addEdge(edge, node12);
                    setState(() {});
                  },
                  child: Text("Add"),
                )
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  scaleEnabled: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(builder),
                    renderer: TreeEdgeRenderer(builder),
                  )),
            ),
          ],
        )
    );
  }

  Random r = Random();

  int n = 1;

  Widget getNodeText() {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.blue[100], spreadRadius: 1),
          ],
        ),
        child: Text("Node ${n++}"));
  }

  final Graph graph = Graph();
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final Node node1 = Node(getNodeText());
    final Node node2 = Node(getNodeText());
    final Node node3 = Node(getNodeText());
    final Node node4 = Node(getNodeText());
    final Node node5 = Node(getNodeText());
    final Node node6 = Node(getNodeText());
    final Node node8 = Node(getNodeText());
    final Node node7 = Node(getNodeText());
    final Node node9 = Node(getNodeText());
    final Node node10 = Node(getNodeText());
    final Node node11 = Node(getNodeText());
    final Node node12 = Node(getNodeText());

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node1, node4);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7);
    graph.addEdge(node6, node8);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10);
    graph.addEdge(node4, node11);
    graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
