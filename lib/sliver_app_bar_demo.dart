import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  const SliverAppBarDemo({super.key});

  @override
  State<SliverAppBarDemo> createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text("标题"),
            expandedHeight: 230.0,
            // collapsedHeight: 120,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.blue,
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                  (context, index) => new ListTile(
                title: new Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
