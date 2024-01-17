import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Loading/xx_refresh_loading.dart';
import 'package:flutter_ui_demo/refresh/xx_refresh_indicator.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class NestScrollViewRefreshPage extends StatefulWidget {
  const NestScrollViewRefreshPage({super.key});

  @override
  State<NestScrollViewRefreshPage> createState() => _NestScrollViewRefreshPageState();
}

class _NestScrollViewRefreshPageState extends State<NestScrollViewRefreshPage> {
  int _itemCount = 20;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Widget result = NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          PullToRefreshContainer(
                (PullToRefreshScrollNotificationInfo? info) {
              return SliverToBoxAdapter(child: XXRefreshIndicator(info));
            },
          ),
        ];
      },
      body: ListView.builder(itemBuilder: (context, index){
        return ListTile(title: Text('第$index行'),);
      }, itemCount: _itemCount, itemExtent: 44,),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pull to Refresh'),
      ),
      body: PullToRefreshNotification(
          onRefresh: _onRefresh,
          pullBackOnRefresh: false,
          child: result
      ),
    );
  }

  Future<bool> _onRefresh() async {
    print('开始刷新数据');
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2000));
    print('刷新数据结束');
    _itemCount = _itemCount + 20;

    return true;
  }

}
