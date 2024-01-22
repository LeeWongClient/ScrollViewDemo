import 'package:flutter/material.dart';

import 'keyboard/keyboard_manager_page.dart';
import 'liefcycle/flutter_stful_life_cycle_page.dart';
import 'load_local_font.dart';

class OtherFlutterPage extends StatefulWidget {
  const OtherFlutterPage({super.key});

  @override
  State<OtherFlutterPage> createState() => _OtherFlutterPageState();
}

class _OtherFlutterPageState extends State<OtherFlutterPage> {
  final List<String> _titles = ['加载字体', '数据库Hive', '键盘监听和处理', '生命周期', '限制文本字数'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('list view demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapLoadFont();
              } else if(index == 1) {

              } else if (index == 2) {
                _onTapKeyboardManager();
              } else if (index == 3) {
                _onTapLifeCycle();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _onTapLoadFont() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadLocalFontPage()));
  }

  _onTapLifeCycle() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterWidget(title: '声明周期',)));
  }

  _onTapKeyboardManager() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => KeyboardManagerPage()));
  }
}
