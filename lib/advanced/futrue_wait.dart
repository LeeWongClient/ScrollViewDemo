import 'package:flutter/material.dart';

class FutureWaitPage extends StatefulWidget {
  const FutureWaitPage({super.key});

  @override
  State<FutureWaitPage> createState() => _FutureWaitPageState();
}

class _FutureWaitPageState extends State<FutureWaitPage> {
  String currentState = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void request2() {
    Future.wait([
      Future.delayed(Duration(seconds: 2), () {
        // 获取用户信息
        return Future.delayed(Duration(milliseconds: 1000), (){

        });
      }).then((data) {
        //处理返回的接口数据
        setState(() {
          currentState = "接口获取成功1";
        });
      }).onError((error, stackTrace) {
        //请求失败的逻辑
      }),

      Future.delayed(Duration(seconds: 3), () {
        // 获取用户任务数量信息
        return Future.delayed(Duration(milliseconds: 2000), (){

        });
      }).then((data) {
        //处理返回的接口数据
        setState(() {
          currentState = "接口获取成功2";
        });
      }).onError((error, stackTrace) {
        //请求失败的逻辑
      })

    ]).then((value){
      // value[0]  就是返回用户信息的数据
      // value[1]  就是返回任务数量信息的数据
      setState(() {
        currentState = "所有接口均请求成功";
      });
    }).catchError((e) {
      print(e);
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
              request2();
            }, child: Text('点击开始执行任务')),
          ],
        ),
      ),
    );
  }
}
