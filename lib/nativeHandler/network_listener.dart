import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutternative/src/flutter_native_communication.dart';

class NetworkListener extends StatefulWidget {
  const NetworkListener({super.key});

  @override
  State<NetworkListener> createState() => _NetworkListenerState();
}

class _NetworkListenerState extends State<NetworkListener> {

  var currentState = '未知(网络有变化才会更新)';

  @override
  void initState() {
    // TODO: implement initState
    FlutterNativePlugin.networkEventListen(onEvent: (event){
      print('收到事件通知 event = $event');
      setState(() {
        currentState = event;
      });
    }, onError: (error){
      print('收到事件失败通知');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络状态变化监听'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text('当前网络状态: $currentState', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text('可以尝试切换网络获取网络状态', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black45)),
          ],
        )
      ),
    );
  }
}
