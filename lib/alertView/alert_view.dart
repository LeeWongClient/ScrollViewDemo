import 'package:flutter/material.dart';

class AlertViewPage extends StatefulWidget {
  const AlertViewPage({super.key});

  @override
  State<AlertViewPage> createState() => _AlertViewPageState();
}

class _AlertViewPageState extends State<AlertViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('alertView'),),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: _alertOnView, child: Text('默认alertView')),
              TextButton(onPressed: _generalAlertOnView, child: Text('默认alertView(general版)')),
              TextButton(onPressed: _simpleAlertView, child: Text('默认simplealertView')),
              TextButton(onPressed: _originDialogAlertView, child: Text('原始dialog')),
              TextButton(onPressed: _originDialogAlertListView, child: Text('原始dialog(内嵌listView)')),
            ],
          ),
        ),
      ),
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
