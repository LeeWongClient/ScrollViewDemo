import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/router_demo_fourth_page.dart';

class RouterDemoThirdPage extends StatefulWidget {
  const RouterDemoThirdPage({super.key});
  @override
  State<RouterDemoThirdPage> createState() => _RouterDemoThirdPageState();
}

class _RouterDemoThirdPageState extends State<RouterDemoThirdPage> {

   List<String> _titles = ['返回上一级', '返回到根页面', '返回到指定页面', '先返回指定页面在跳转到下一级', '跳转到下一级替换当前页面'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('第三个页面'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _onTapBack();
              } else if (index == 1) {
                _onTapPopToRoot();
              } else if (index == 2) {
                _onTapTwoPop();
              } else if (index == 3) {
                _onTapRemoveAndPush();
              } else if (index == 4) {
                _onTapPushReplace();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _onTapBack() {
    Navigator.of(context).pop('我是返回值');
  }

  _onTapPopToRoot() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  _onTapTwoPop() {
    Navigator.of(context).popUntil((route) {
      /// 注意这里popUtil是表示 会一直调用pop方法直到这个方法返回true为止
      print(route.settings.name);
      /// 因此 假设页面堆栈是A->B -> C ->D -> E 如果我要返回到B页面我这里的判断条件应该是如果name=B则返回true
      /// flutter: RouterDemoSecondPage
      /// flutter: RouterDemoHomePage
      /// flutter: MyHomePage
      if (route.settings.name == 'RouterDemoHomePage') {
        return true;
      }
      return false;
    });
  }

  _onTapRemoveAndPush() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RouterDemoForthPage()), (route) {
      if (route.settings.name == 'RouterDemoHomePage') {
        return true;
      }
      return false;
    });
  }
  
  _onTapPopAndPush() {
    // 这里要求先设置routeName 就先不尝试了
    // 功能是先pop到上一级在push到新页面
    // Navigator.of(context).popAndPushNamed(routeName)
  }

  _onTapPushReplace() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RouterDemoForthPage()));
  }
}
