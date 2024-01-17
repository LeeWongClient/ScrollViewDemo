import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/Loading/xx_refresh_loading.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
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
              TextButton(onPressed: _onTapShowLoading, child: Text('页面中间的loading')),
              TextButton(onPressed: _onTapFixWidthShowLoading, child: Text('页面中间的loading(自定义)')),
              TextButton(onPressed: _onTapShowCumenLoading, child: Text('页面中间的loading(粗门)')),
            ],
          ),
        ),
      ),
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
