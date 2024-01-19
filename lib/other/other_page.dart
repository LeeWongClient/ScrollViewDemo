import 'package:flutter/material.dart';

import 'load_local_font.dart';

class OtherFlutterPage extends StatefulWidget {
  const OtherFlutterPage({super.key});

  @override
  State<OtherFlutterPage> createState() => _OtherFlutterPageState();
}

class _OtherFlutterPageState extends State<OtherFlutterPage> {
  final List<String> _titles = ['加载字体', ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('list view demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapLoadFont();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _onTapLoadFont() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadLocalFontPage()));
  }
}
