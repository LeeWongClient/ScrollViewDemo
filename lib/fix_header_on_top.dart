import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fix_header.dart';

class StickHeaderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StickHeaderPageState();
  }

}

class _StickHeaderPageState extends State<StickHeaderPage> {

  bool upgrade = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sticky Header"),
        actions: [
          upgrade ? TextButton(onPressed: _upgradeDidClick, child: Text('恢复默认')) : TextButton(onPressed: _recoverDidClick, child: Text('优化'))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _topWidget(),
          /// 无法支持两个分组的情况 ！！！！！ 因为虽然两个header都吸顶了 但是后面的header被前面的header覆盖了
          upgrade ? _buildSection('section 1') : _stickyHeader('section 1', Colors.blue),
          _listView(20),
          upgrade ? _buildSection('section 2') : _stickyHeader('section 2', Colors.blue),
          _listView(20),
        ],
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  _upgradeDidClick() {
    setState(() {
      upgrade = !upgrade;

    });
  }

  _recoverDidClick() {
    setState(() {
      upgrade = !upgrade;

    });
  }

  Widget _topWidget() {
    return SliverToBoxAdapter(
      child: Container(
        child: Image.network("https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg",
        ),
      ),
    );
  }

  _buildSection(String title) {
    return StickySliverToBoxAdapter(
        child: RepaintBoundary(
          child: Container(
            height: 50,
            color: Colors.brown,
            alignment: Alignment.center,
            child: Text(title),
          ),
        )
    );
  }

  Widget _stickyHeader(String title, Color color) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _StickyHeaderDelegate(
        minHeight: 50,
        maxHeight: 50,
        child: Container(
          height: 100,
          color: color,
          alignment: Alignment.centerLeft,
          child:  Text(title, style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }

  Widget _listView(int count) {
    return SliverList(
        delegate:
        SliverChildBuilderDelegate( (context, index) {
          return Container(
            height: 50,
            color: index % 2 == 0 ? Colors.white : Colors.black12,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("Item $index"),
          );
        },
          childCount: count,
        )
    );
  }

}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {

  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return (
        maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
            child != oldDelegate.child
    );
  }
}


