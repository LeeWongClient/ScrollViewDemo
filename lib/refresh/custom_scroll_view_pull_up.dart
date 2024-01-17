import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomScrollViewPullDownRefreshPage extends StatefulWidget {
  const CustomScrollViewPullDownRefreshPage({super.key});

  @override
  State<CustomScrollViewPullDownRefreshPage> createState() => _CustomScrollViewPullDownRefreshPageState();
}

class _CustomScrollViewPullDownRefreshPageState extends State<CustomScrollViewPullDownRefreshPage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    items = ["1", "2", "3", "4", "5", "6", "7", "8"];
    setState(() {

    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View'),),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body ;
            if(mode == LoadStatus.idle){
              body =  Text("pull up load");
            } else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            } else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            } else if(mode == LoadStatus.canLoading){
              body = Text("release to load more");
            } else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => ListTile(title: Text('第$i行'),),
          itemExtent: 44.0,
          itemCount: items.length,
        ),
      ),
    );
  }

}
