import 'dart:async';

import 'package:flutter/material.dart';
import 'avoid_repeat_click.dart';

class TimerDebouncePage extends StatefulWidget {
  const TimerDebouncePage({super.key});

  @override
  State<TimerDebouncePage> createState() => _TimerDebouncePageState();
}

class _TimerDebouncePageState extends State<TimerDebouncePage> {

  Timer? _debounceTimer;
  Timer? _clickTimer;
  int clickCount = 0;
  int delayClickCount = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  void dispose() {
    super.dispose();
    if(_clickTimer != null && _clickTimer!.isActive) {
      _clickTimer!.cancel();
    }
  }


  _startTimer() {
    _clickTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      CommonUtils.throttle((){
        setState(() {
          delayClickCount++;
        });
      }, 1000)();
      setState(() {
        clickCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('控制回调频率'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("未使用频次控制:"),
                Text('$clickCount', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("未使用频次控制:"),
                Text('$delayClickCount', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )
          ],
        )
      ),
    );
  }
}
