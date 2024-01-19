import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutternative/src/flutter_native_communication.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  double currentTimerCount = 0;

  @override
  void initState() {
    super.initState();
    _startTimerSubscription();
  }

  void _startTimerSubscription() {
    FlutterNativePlugin.timerEventListen(onEvent: (event){
      setState(() {
        currentTimerCount = event;
      });
    }, onError: (err){
      print('收到事件失败通知');
    });
  }

  @override
  void dispose() {
    super.dispose();
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
              Text('当前计数: $currentTimerCount', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ],
          )
      ),
    );
  }
}