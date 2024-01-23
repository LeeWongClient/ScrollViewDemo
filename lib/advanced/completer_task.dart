import 'dart:async';

import 'package:flutter/material.dart';

class MultiTaskAsyncPage extends StatefulWidget {
  const MultiTaskAsyncPage({super.key});

  @override
  State<MultiTaskAsyncPage> createState() => _MultiTaskAsyncPageState();
}

class _MultiTaskAsyncPageState extends State<MultiTaskAsyncPage> {

  String currentState = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void performTasks() {
    final completer = Completer();

    // 创建一个计数器，用于跟踪任务完成的数量
    var taskCount = 0;

    // 定义任务1
    Future<void> task1() async {
      await Future.delayed(Duration(seconds: 2));
      print('Task 1 completed');
      taskCount++;
      setState(() {
        currentState = "任务1执行完成";
      });
      if (taskCount == 2) {
        completer.complete(); // 所有任务完成

      }
    }

    // 定义任务2
    Future<void> task2() async {
      await Future.delayed(Duration(seconds: 5));
      print('Task 2 completed');
      taskCount++;
      setState(() {
        currentState = "任务2执行完成";
      });
      if (taskCount == 2) {
        completer.complete(); // 所有任务完成
      }
    }

    task1();
    task2();

    completer.future.then((_) {
      setState(() {
        currentState = "所有任务都执行完成";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('多个任务同时执行执行完成后获取统一结果'),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text(currentState),
            SizedBox(height: 200,),
            TextButton(onPressed: () {
              performTasks();
            }, child: Text('点击开始执行任务')),
          ],
        ),
      ),
    );
  }
}
