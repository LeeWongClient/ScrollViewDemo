import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Loading/xx_refresh_loading.dart';
import 'package:flutter_ui_demo/refresh/xx_refresh_indicator.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class CustomScrollViewRefreshPage extends StatefulWidget {
  const CustomScrollViewRefreshPage({super.key});

  @override
  State<CustomScrollViewRefreshPage> createState() => _CustomScrollViewRefreshPageState();
}

class _CustomScrollViewRefreshPageState extends State<CustomScrollViewRefreshPage> {
  int _itemCount = 20;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Widget easyWidget = CustomScrollView(
      slivers: [
        PullToRefreshContainer(
              (PullToRefreshScrollNotificationInfo? info) {
            return SliverToBoxAdapter(child: XXRefreshIndicator(info));
          },
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(title: Text('第$index行'),);
        }, childCount: _itemCount,),),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pull to Refresh'),
      ),
      body: PullToRefreshNotification(
          onRefresh: _onRefresh,
          pullBackOnRefresh: false,
          child: easyWidget
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
