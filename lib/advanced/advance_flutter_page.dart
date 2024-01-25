import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/advanced/avoid_repeat_click.dart';
import 'package:flutter_ui_demo/advanced/completer_task.dart';
import 'package:flutter_ui_demo/advanced/create_load_local_file.dart';
import 'package:flutter_ui_demo/advanced/flutter_snap_native_show.dart';
import 'package:flutter_ui_demo/advanced/timer_debounce_page.dart';

import 'flutter_auto_complete.dart';
import 'futrue_wait.dart';

class AdvanceFlutterPage extends StatefulWidget {
  const AdvanceFlutterPage({super.key});

  @override
  State<AdvanceFlutterPage> createState() => _AdvanceFlutterPageState();
}

class _AdvanceFlutterPageState extends State<AdvanceFlutterPage> {
  final List<String> _titles = ['输入防抖', '定时器防抖', '按钮放连点', '多个任务同时执行，监听都完成的状态', '文件共享', '展示gif'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('list view demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapTimesControl();
              } else if (index == 1) {
                _onTapTimeDebouncePage();
              } else if (index == 2) {
                _onTapRepeatClick();
              } else if (index == 3) {
                _onTapMultiTask();
              } else if (index == 4) {
                _onTapShareFile();
              } else if (index == 5) {
                _onTapShowGifPage();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }


  _onTapTimesControl() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AutoCompleteDebouncePage()));
  }

  _onTapTimeDebouncePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerDebouncePage()));
  }

  _onTapRepeatClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AvoidRepeatClickPage()));
  }

  _onTapMultiTask() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FutureWaitPage()));
  }

  _onTapShareFile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoadAndCreateLocalFilePage()));
  }

  _onTapShowGifPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterSnapNativeDrawPage()));
  }
}
