import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_ui_demo/floating_app_bar.dart';
import 'package:flutter_ui_demo/sliver_app_bar_background.dart';
import 'package:flutter_ui_demo/sliver_app_bar_demo.dart';

import 'fix_header_on_top.dart';
import 'list_view_and_header.dart';
import 'nest_scroll_view.dart';
import 'nestscrollview_sliverappbar.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: _onTapListViewAndZoomHeader, child: Text('拉下放大header+滚动视图')),
              TextButton(onPressed: _onTapFloatingAppBar, child: Text('appBar 默认效果')),
              TextButton(onPressed: _onTapStickHeader, child: Text('吸顶效果 有导航')),
              TextButton(onPressed: _onTapSliverAppBar, child: Text('sliver app bar ')),
              TextButton(onPressed: _onTapSliverAppBarBackground, child: Text('sliver app bar background')),
              TextButton(onPressed: _onTapNestScrollView, child: Text('nestscrollview demo')),
              TextButton(onPressed: _onTapNestScrollViewAndAppBar, child: Text('nestscrollviewandappbar demo'))
            ],
          ),
        ),
      ),
    );
  }

  _onTapListViewAndZoomHeader() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewWithHeader()));
  }

  _onTapFloatingAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FloatingAppBarDemo()));
  }

  _onTapStickHeader() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StickHeaderPage()));
  }

  _onTapSliverAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarDemo()));
  }

  _onTapSliverAppBarBackground() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarBackgoundDemo()));
  }

  _onTapNestScrollView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewDemo()));
  }

  _onTapNestScrollViewAndAppBar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NestScrollViewAndAppBar()));
  }
}
