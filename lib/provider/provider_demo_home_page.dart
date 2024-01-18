import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/popView/xx_design.dart';
import 'package:flutter_ui_demo/provider/ui_data_provider.dart';

import 'multi_provider_page.dart';

class ProviderDemoPage extends StatefulWidget {
  const ProviderDemoPage({super.key});

  @override
  State<ProviderDemoPage> createState() => _ProviderDemoPageState();
}

class _ProviderDemoPageState extends State<ProviderDemoPage> {

  List<String> _titles = ['单个Provider', '多个Provider'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('flutter ui demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _singleProviderTap();
              } else if (index == 1) {
                _multiProviderTap();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _singleProviderTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UIDataProviderPage.provider()));
  }

  _multiProviderTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MultiProviderPage.provider()));
  }
}
