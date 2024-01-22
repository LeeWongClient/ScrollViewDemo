import 'dart:async';

import 'package:flutter/material.dart';

class CommonUtils{
  static Timer? _debounce;
  static Function debounce(Function fn, [int t = 300]) {
    return () {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) {
        print('定时器计时中 取消之前的计时');
        _debounce?.cancel();
      }else{
        fn();
        print('执行延时的操作');
      }
      print('重新创建定时器  ${DateTime.now()}');
      _debounce = Timer(Duration(milliseconds: t), () {
        print('延时后 执行定时器销毁方法 ${DateTime.now()}');
        _debounce?.cancel();
        _debounce = null;
      });
    };
  }
  static Timer? _throttle;
  static Function throttle(Function fn, [int t = 300]) {
    return () {
      // 还在时间之内，抛弃上一次
      if (_throttle?.isActive ?? false) {
        print('定时器计时中 取消之前的计时');
        return;
      }else{
        fn();
        print('执行延时的操作');
      }
      print('创建定时器 在指定时间内不在接受点击事件  ${DateTime.now()}');
      _throttle = Timer(Duration(milliseconds: t), () {
        print('延时后 执行定时器销毁方法 ${DateTime.now()}');
        _throttle?.cancel();
        _throttle = null;
      });
    };
  }

  static DateTime? _lastTime;
  static preventDoubleTap({required Function fn, required int interval}){
    DateTime _nowTime = DateTime.now();
    if(_lastTime == null || _nowTime.difference(_lastTime!) > Duration(milliseconds: interval??600)){
      _lastTime = _nowTime;
      fn();
    }else {
      _lastTime = _nowTime;
    }
  }
}


class AvoidRepeatClickPage extends StatefulWidget {
  const AvoidRepeatClickPage({super.key});

  @override
  State<AvoidRepeatClickPage> createState() => _AvoidRepeatClickPageState();
}

class _AvoidRepeatClickPageState extends State<AvoidRepeatClickPage> {
  int clickCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('防止连续点击'),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text('当前点击次数 $clickCount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
            SizedBox(height: 200,),
            TextButton(onPressed: () {
              print('点击了');
              CommonUtils.debounce((){
                setState(() {
                  clickCount++;
                });
              }, 1000)();
            }, child: Text('尝试连续点击这个按钮')),
            TextButton(onPressed: () {
              print('点击了');
              CommonUtils.preventDoubleTap(fn: (){
                setState(() {
                  clickCount++;
                });
              }, interval: 1000);
            }, child: Text('尝试连续点击这个按钮'))
          ],
        ),
      ),
    );
  }
}


