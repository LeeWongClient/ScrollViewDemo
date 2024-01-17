import 'package:flutter/material.dart';

class AlertViewPage extends StatefulWidget {
  const AlertViewPage({super.key});

  @override
  State<AlertViewPage> createState() => _AlertViewPageState();
}

class _AlertViewPageState extends State<AlertViewPage> {

  List<String> _titles = ['默认alertView', '默认alertView(general版)', '默认simplealertView', '原始dialog', '原始dialog(内嵌listView)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _alertOnView();
              } else if (index == 1) {
                _generalAlertOnView();
              } else if (index == 2) {
                _simpleAlertView();
              } else if (index == 3) {
                _originDialogAlertView();
              } else if (index == 4) {
                _originDialogAlertListView();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _originDialogAlertView() {
    showDialog(context: context, builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: _onClickCancel, child: Text('直接退出')),
            TextButton(onPressed: _onClickConfirm, child: Text('保存并退出'))
          ],
        ),
      );
    });
  }

  _originDialogAlertListView() {
    showDialog(context: context, builder: (context) {
      return Dialog(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.red,
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(title: Text('title $index'),);
        }, itemCount: 20, itemExtent: 44,),
      );
    });
  }


  _simpleAlertView() {
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text('提示'),
        children: [
          TextButton(onPressed: _onClickCancel, child: Text('直接退出')),
          TextButton(onPressed: _onClickConfirm, child: Text('保存并退出'))
        ],
      );
    });
  }


  _alertOnView() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('警告'),
        content: Text('确认要删除文件吗'),
        actions: [
          TextButton(onPressed: _onClickCancel, child: Text('取消')),
          TextButton(onPressed: _onClickConfirm, child: Text('确定'))
        ],
      );
    });
  }

  _generalAlertOnView() {
    showGeneralDialog(context: context, pageBuilder: (context, an1, an2){
      return AlertDialog(
        title: Text('警告'),
        content: Text('确认要删除文件吗'),
        actions: [
          TextButton(onPressed: _onClickCancel, child: Text('取消')),
          TextButton(onPressed: _onClickConfirm, child: Text('确定'))
        ],
      );
    }, transitionDuration: Duration(milliseconds: 1000), transitionBuilder: _buildMaterialDialogTransitions);
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  _onClickCancel() {
    print('click cancel');
    Navigator.of(context).pop();
  }

  _onClickConfirm() {
    print('click confirm');
    Navigator.of(context).pop();
  }
}
