import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/refresh/custom_scroll_view.dart';

import 'custom_scroll_view_pull_up.dart';
import 'nest_scroll_view.dart';

class RefreshListViewPage extends StatefulWidget {
  const RefreshListViewPage({super.key});

  @override
  State<RefreshListViewPage> createState() => _RefreshListViewPageState();
}

class _RefreshListViewPageState extends State<RefreshListViewPage> {

  List<String> _titles = ['customScrollView(pull_to_refresh_notification) 下拉刷新', 'NestedScrollView(pull_to_refresh_notification) 下拉刷新', 'customScrollView(pull_to_refresh_flutter3)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.separated(itemBuilder: (context, index){
            return ListTile(title: FittedBox(fit: BoxFit.contain, child: Text(_titles[index],)), onTap: () {
              if (index == 0) {
                _onTapCustomScrollView();
              } else if (index == 1) {
                _onTapNestScrollView();
              } else if (index == 2) {
                _onTapCustomScrollRefresh();
              }
            },);
          }, separatorBuilder: (context, index) {
            return Divider(color: Colors.white,);
          }, itemCount: _titles.length,)
        )
    );
  }
    _onTapCustomScrollView() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomScrollViewRefreshPage()));
    }

    _onTapNestScrollView() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewRefreshPage()));
    }

    _onTapCustomScrollRefresh() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomScrollViewPullDownRefreshPage()));
    }
}
