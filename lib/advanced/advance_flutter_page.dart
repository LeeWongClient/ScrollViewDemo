import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/advanced/avoid_repeat_click.dart';
import 'package:flutter_ui_demo/advanced/timer_debounce_page.dart';

import 'flutter_auto_complete.dart';

class AdvanceFlutterPage extends StatefulWidget {
  const AdvanceFlutterPage({super.key});

  @override
  State<AdvanceFlutterPage> createState() => _AdvanceFlutterPageState();
}

class _AdvanceFlutterPageState extends State<AdvanceFlutterPage> {
  final List<String> _titles = ['输入防抖', '定时器防抖', '按钮放连点'];

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
}
