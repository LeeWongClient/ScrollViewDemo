import 'package:flutter/material.dart';

class SliverAppBarBackgoundDemo extends StatefulWidget {
  const SliverAppBarBackgoundDemo({super.key});

  @override
  State<SliverAppBarBackgoundDemo> createState() => _SliverAppBarBackgoundDemoState();
}

class _SliverAppBarBackgoundDemoState extends State<SliverAppBarBackgoundDemo> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            // title: Text("标题"),
            expandedHeight: 230.0,
            // 设置这个属性可以让页面滚动到顶部时flexibleSpace的颜色融合
            backgroundColor: Colors.red,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.red,
              ),
              title: new Text("标题标题标题"),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
            // bottom: PreferredSize(
            //   preferredSize: Size(screenSize.width, screenSize.height),
            //   child: Container(
            //     color: Colors.yellow,
            //   ),
            // ),
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
