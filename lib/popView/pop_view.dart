import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/popView/xx_design.dart';

class PopViewPage extends StatefulWidget {
  const PopViewPage({super.key});

  @override
  State<PopViewPage> createState() => _PopViewPageState();
}

class _PopViewPageState extends State<PopViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部弹出视图样式'),),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: _buildBottomPopView, child: Text('底部弹出视图(简单版)')),
              TextButton(onPressed: _buildBottomFullScreenPopView, child: Text('底部弹出视图(全屏款)')),
              TextButton(onPressed: _buildOtherColorBottomPopView, child: Text('底部弹出视图(外部颜色)')),
              TextButton(onPressed: _buildDragDismissBottomPopView, child: Text('底部弹出视图(不可拖拽)')),
              TextButton(onPressed: _buildBottomPopListView, child: Text('底部弹出视图(有列表)')),
              TextButton(onPressed: _buildCumenBottomPopView, child: Text('底部弹出视图(粗门款 有斜边)')),
            ],
          ),
        ),
      ),
    );
  }

  _buildBottomPopView() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        color: Colors.red,
      );
    });
  }

  _buildBottomFullScreenPopView() {
    // 默认展示全屏
    showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) {
      return Container(
        color: Colors.red,
      );
    });
  }

  _buildOtherColorBottomPopView() {
    // 设置弹窗上面部分的背景颜色
    showModalBottomSheet(context: context, barrierColor: Colors.blue, builder: (context) {
      return Container(
        color: Colors.red,
      );
    });
  }

  _buildDragDismissBottomPopView() {
    // 设置弹窗上面部分的背景颜色
    showModalBottomSheet(context: context, enableDrag: false, builder: (context) {
      return Container(
        color: Colors.red,
      );
    });
  }

  _buildCumenBottomPopView() {
    /// 必须设置clipBehavior: Clip.hardEdge 才可以展示正确的斜边
    showModalBottomSheet(context: context, shape: ItalicRoundedBorderShape(), clipBehavior: Clip.hardEdge, builder: (context) {
      return Container(
        color: Colors.red,
      );
    });
  }

  _buildBottomPopListView() {
    showModalBottomSheet(context: context, builder: (context) {
      return ListView.builder(itemBuilder: (context, index){
        return ListTile(title: Text('index $index'),);
      }, itemCount: 30, itemExtent: 44,);
    });
  }

}
