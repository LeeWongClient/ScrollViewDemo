import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/refresh/custom_scroll_view.dart';

import 'nest_scroll_view.dart';

class RefreshListViewPage extends StatefulWidget {
  const RefreshListViewPage({super.key});

  @override
  State<RefreshListViewPage> createState() => _RefreshListViewPageState();
}

class _RefreshListViewPageState extends State<RefreshListViewPage> {

  List<String> _titles = ['customScrollView', 'NestedScrollView'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapCustomScrollView();
              } else if (index == 1) {
                _onTapNestScrollView();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }
    _onTapCustomScrollView() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomScrollViewRefreshPage()));
    }

    _onTapNestScrollView() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewRefreshPage()));
    }
}
