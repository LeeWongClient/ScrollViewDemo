import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/gorouter/router_demo_go_router.dart';
import 'package:flutter_ui_demo/router/router_demo_router_config_page.dart';
import 'package:flutter_ui_demo/router/router_demo_second_page.dart';

class RouterDemoHomePage extends StatefulWidget {
  const RouterDemoHomePage({super.key});

  @override
  State<RouterDemoHomePage> createState() => _RouterDemoHomePageState();
}

class _RouterDemoHomePageState extends State<RouterDemoHomePage> {

  List<String> _titles = ['普通跳转和返回', '系统跳转(无动画版)', '带参数的跳转', '路由配置', 'GoRouter'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('demo home page'),),
        body: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text(_titles[index],), onTap: () {
              if (index == 0) {
                _defaultRouterTap();
              } else if (index == 1) {
                _routerWithoutAnimation();
              } else if (index == 2) {
                _routerWithParam();
              } else if (index == 3) {
                _routerWithConfig();
              } else if (index == 4) {
                _routerWithGoRouter();
              }
            },);
          }, itemCount: _titles.length, itemExtent: 44,),
        )
    );
  }

  _defaultRouterTap() {
    Navigator.push(context, MaterialPageRoute(settings: RouteSettings(name: 'RouterDemoSecondPage'), builder: (context) => RouterDemoSecondPage()));
  }

  _routerWithoutAnimation() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return RouterDemoSecondPage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          ///transitionsBuilder属性用于构建过渡动画，这里将其设为返回child，即不进行任何过渡动画，达到移除动画效果的目的。
          return child;
        },
      ),
    );
  }

  _routerWithParam() {
    Navigator.push(context, MaterialPageRoute(settings: RouteSettings(name: 'RouterDemoSecondPage'), builder: (context) => RouterDemoSecondPage(param: {'name': '我是参数'},)));
  }

  _routerWithConfig() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RouterConfigEntrance()));
  }

  _routerWithGoRouter() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GoRouterMain()));
  }
}
