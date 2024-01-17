import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/listview/sliver_app_bar_background.dart';
import 'package:flutter_ui_demo/listview/sliver_app_bar_demo.dart';

import 'fix_header_on_top.dart';
import 'floating_app_bar.dart';
import 'list_view_and_header.dart';
import 'nest_scroll_view.dart';
import 'nestscrollview_sliverappbar.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('list view demo'),),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: _onTapListViewAndZoomHeader, child: Text('拉下放大header+滚动视图')),
              TextButton(onPressed: _onTapFloatingAppBar, child: Text('appBar 默认效果')),
              TextButton(onPressed: _onTapStickHeader, child: Text('吸顶效果 有导航')),
              TextButton(onPressed: _onTapSliverAppBar, child: Text('sliver app bar ')),
              TextButton(onPressed: _onTapSliverAppBarBackground, child: Text('sliver app bar background')),
              TextButton(onPressed: _onTapNestScrollView, child: Text('nestscrollview demo')),
              TextButton(onPressed: _onTapNestScrollViewAndAppBar, child: Text('nestscrollviewandappbar demo'))
            ],
          ),
        ),
      ),
    );
  }


  _onTapListViewAndZoomHeader() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewWithHeader()));
  }

  _onTapFloatingAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FloatingAppBarDemo()));
  }

  _onTapStickHeader() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StickHeaderPage()));
  }

  _onTapSliverAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarDemo()));
  }

  _onTapSliverAppBarBackground() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarBackgoundDemo()));
  }

  _onTapNestScrollView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewDemo()));
  }

  _onTapNestScrollViewAndAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewAndAppBar()));
  }
}
