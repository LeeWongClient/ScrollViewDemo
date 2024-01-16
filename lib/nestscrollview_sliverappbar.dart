import 'package:flutter/material.dart';

class NestScrollViewAndAppBar extends StatefulWidget {
  const NestScrollViewAndAppBar({super.key});

  @override
  State<NestScrollViewAndAppBar> createState() => _NestScrollViewAndAppBarState();
}

class _NestScrollViewAndAppBarState extends State<NestScrollViewAndAppBar> {
  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: 300,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "images/professional_pay_from_club_page.png",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(tabs: _tabs.map((String name) => Tab(text: name,)).toList(), indicatorColor: Colors.red, labelColor: Colors.green, unselectedLabelColor: Colors.black,),
              ),
            ),
          ];
        }, body: TabBarView(
            children: _tabs.map((title) {
              return Builder(builder: (BuildContext context){
                return CustomScrollView(
                  key: PageStorageKey<String>(title),
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: buildSliverList(50),
                    ),
                  ],
                );
              });
            }).toList(),
        ),
        ),),
      );
  }



  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }
}
