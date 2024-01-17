import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_ui_demo/Loading/loading_view.dart';
import 'package:flutter_ui_demo/alertView/alert_view.dart';
import 'package:flutter_ui_demo/netImage/netImageViewPage.dart';
import 'package:flutter_ui_demo/popView/pop_view.dart';
import 'package:flutter_ui_demo/provider/multi_provider_page.dart';
import 'package:flutter_ui_demo/provider/ui_data_provider.dart';
import 'package:flutter_ui_demo/refresh/listview_refresh.dart';
import 'package:flutter_ui_demo/safeArea/safe_area_adapter.dart';
import 'package:flutter_ui_demo/vieweffect/view_effect.dart';

import 'listview/list_view_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _titles = ['列表视图示例', '渐变效果示例', '底部弹窗类', '页面中间弹窗类', 'Loading框', '上下拉刷新', '网络图片展示', '安全区域适配', 'UI和数据绑定'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter ui demo'),),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(title: Text(_titles[index],), onTap: () {
            if(index == 0) {
              _onTapListView();
            } else if(index == 1) {
              _onTapGradient();
            } else if(index == 2) {
              _onTapPopView();
            } else if(index == 3) {
              _onTapAlertView();
            } else if(index == 4) {
              _onTapLoadingView();
            } else if(index == 5) {
              _onTapRefresh();
            } else if (index == 6) {
              _onTapNetworkImage();
            } else if (index == 7) {
              _onTapSafeAreaAdapter();
            } else if (index == 8) {
              _onTapUIDataBinder();
            }
          },);
        }, itemCount: _titles.length, itemExtent: 44,),
      )
    );
  }

  _onTapRefresh() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RefreshListViewPage()));
  }

  _onTapListView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewPage()));
  }

  _onTapGradient() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewEffectPage()));
  }

  _onTapPopView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PopViewPage()));
  }

  _onTapAlertView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AlertViewPage()));
  }

  _onTapLoadingView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingPage()));
  }

  _onTapNetworkImage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkImagePage()));
  }

  _onTapSafeAreaAdapter() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SafeAreaAdapterPage()));
  }

  _onTapUIDataBinder() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MultiProviderPage.provider()));
  }
}
