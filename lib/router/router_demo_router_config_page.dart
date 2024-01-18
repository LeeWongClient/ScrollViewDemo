import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/router_demo_second_page.dart';
import 'package:flutter_ui_demo/router/router_demo_third_page.dart';


class RouterConfigEntrance extends StatelessWidget {
  const RouterConfigEntrance({super.key});

  @override
  Widget build(BuildContext context) {

    Route<dynamic>? generateRoute(RouteSettings settings) {
      // 解析路由名称
      final List<String>? pathElements = settings.name?.split('/');
      if (pathElements?[0] != '') return null; // 如果路径不正确，则返回 null

      // 根据路由名称生成对应的页面
      if (pathElements?[1] == 'page2') {
        // 可以根据需要传递参数
        String? parameter = (pathElements?.length ?? 0) > 2 ? (pathElements?[2] ?? '') : null;
        // 参数也有可能通过argument
        if(parameter == null && settings.arguments != null) {
          parameter = settings.arguments as String;
        }
        return MaterialPageRoute(
          builder: (context) => RouterDemoSecondPage(param: {"name": parameter ?? ''},),
        );
      } else if (pathElements?[1] == 'page3') {
        return MaterialPageRoute(
          builder: (context) => RouterDemoThirdPage(),
        );
      }

      // 如果路由名称不匹配任何页面，则返回 null
      return null;
    }

    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: generateRoute,
      routes: {
        '/': (context) => RouterConfigPage(),
      },
    );
  }
}


class RouterConfigPage extends StatefulWidget {
  const RouterConfigPage({super.key});

  @override
  State<RouterConfigPage> createState() => _RouterConfigPageState();
}

class _RouterConfigPageState extends State<RouterConfigPage> {

  List<String> _titles = ['普通跳转和返回', '带参数的跳转', '参数在path中','返回(返回后就黑屏了 因为一般情况这里是根视图)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('router config'), ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(title: Text(_titles[index],), onTap: () {
          if (index == 0) {
            _defaultRouterTap();
          } else if (index == 1) {
            _routerWithParam();
          } else if (index == 2) {
            _routerWithParamInPath();
          } else if (index == 3) {
            _onTapBack();
          }
        },);
      }, itemCount: _titles.length, itemExtent: 44,),
    );
  }

  _defaultRouterTap() {
    Navigator.pushNamed(context, '/page2');
  }

  _routerWithParam() {
    Navigator.pushNamed(context, '/page2', arguments: '我是参数');
  }

  _routerWithParamInPath() {
    Navigator.pushNamed(context, '/page2/param', arguments: '我是参数');
  }

  _onTapBack() {
    Navigator.pop(context);
  }
}
