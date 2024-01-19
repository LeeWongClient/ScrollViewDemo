import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutternative/src/flutter_native_communication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double timeInterval = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativePlugin.timerEventListen(onEvent: (event){
      print(event);
      setState(() {
        timeInterval = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('计时器 $timeInterval'),
        ),
      ),
    );
  }

  _shakePhone() {

  }
}
