import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/vieweffect/draw_path.dart';
import 'package:flutter_ui_demo/vieweffect/ui_corder_radius.dart';
import 'package:flutter_ui_demo/vieweffect/view_effect.dart';

class UIEffectPage extends StatefulWidget {
  const UIEffectPage({super.key});

  @override
  State<UIEffectPage> createState() => _UIEffectPageState();
}

class _UIEffectPageState extends State<UIEffectPage> {
  final List<String> _titles = ['渐变色', '圆角设置', '绘制曲线',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('list view demo'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapGradientView();
              } else if (index == 1) {
                _onTapCornerRadius();
              } else if (index == 2) {
                _onTapDrawPath();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }


  _onTapGradientView() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewEffectPage()));
  }

  _onTapCornerRadius() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UICornerRadiusPage()));
  }

  _onTapDrawPath() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DrawCurvePath()));
  }
}
