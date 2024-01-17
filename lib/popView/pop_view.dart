import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/popView/xx_design.dart';

class PopViewPage extends StatefulWidget {
  const PopViewPage({super.key});

  @override
  State<PopViewPage> createState() => _PopViewPageState();
}

class _PopViewPageState extends State<PopViewPage> {

  List<String> _titles = ['底部弹出视图(简单版)', '底部弹出视图(全屏款)', '底部弹出视图(外部颜色)', '底部弹出视图(不可拖拽)', '底部弹出视图(有列表)', '底部弹出视图(粗门款 有斜边)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _buildBottomPopView();
              } else if (index == 1) {
                _buildBottomFullScreenPopView();
              } else if(index == 2) {
                _buildOtherColorBottomPopView();
              } else if(index == 3) {
                _buildDragDismissBottomPopView();
              } else if(index == 4) {
                _buildBottomPopListView();
              } else if(index == 5) {
                _buildCumenBottomPopView();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
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
