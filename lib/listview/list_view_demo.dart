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
 final List<String> _titles = ['拉下放大header+滚动视图', 'appBar 默认效果', '吸顶效果 有导航', 'sliver app bar ', 'sliver app bar background', 'nestscrollview demo', 'nestscrollviewandappbar demo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('list view demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapListViewAndZoomHeader();
              } else if (index == 1) {
                _onTapFloatingAppBar();
              } else if(index == 2) {
                _onTapStickHeader();
              } else if(index == 3) {
                _onTapSliverAppBar();
              } else if(index == 4) {
                _onTapSliverAppBarBackground();
              } else if(index == 5) {
                _onTapNestScrollView();
              } else if (index == 6) {
                _onTapNestScrollViewAndAppBar();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
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
