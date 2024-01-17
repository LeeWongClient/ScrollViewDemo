import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Loading/xx_refresh_loading.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  List<String> _titles = ['页面中间的loading', '页面中间的loading(自定义)', '页面中间的loading(粗门)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapShowLoading();
              } else if (index == 1) {
                _onTapFixWidthShowLoading();
              } else if (index == 2) {
                _onTapShowCumenLoading();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _onTapShowCumenLoading() {
    showDialog(context: context, barrierDismissible: true, builder: (context) {
      return AlertDialog(
        // 这里无法控制loading的大小
        contentPadding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
        content: Container(
          width: 80,
          height: 80,
          child: XXLoadingIndicator(),
        ),
      );
    });
  }

  Padding _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(width: 20, height: 20, child: XXLoadingIndicator()),
    );
  }

  _onTapShowLoading() {
    showDialog(
      context: context,
      barrierDismissible: true, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

    _onTapFixWidthShowLoading() {
      showDialog(
        context: context,
        barrierDismissible: true, //点击遮罩不关闭对话框
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(value: .8,),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Text("正在加载，请稍后..."),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
