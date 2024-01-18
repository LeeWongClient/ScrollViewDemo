import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/gorouter/go_router_last_page.dart';
import 'package:go_router/go_router.dart';

import 'go_router_detail_page.dart';

class GoRouterMain extends StatelessWidget {
  const GoRouterMain({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterDemoPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const GoRouterDetailPage();
              },
            ),
            GoRoute(
              path: 'last',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: GoRouterLastPage(),
              ),
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}


class GoRouterDemoPage extends StatefulWidget {
  const GoRouterDemoPage({super.key});

  @override
  State<GoRouterDemoPage> createState() => _GoRouterDemoPageState();
}


/// 在GoRouter中页面跳转我们有两个选项
/// 1、go
/// 2、push
/// 这两种方式之间是有区别的
/// 当我们使用go时，页面的堆栈会依赖我们在定义页面路由时提供的路径，假设我们有三个页面
///   A: path = '/'
///   B: path = '/detail'
///   C: path = '/detail/pay'
///   如果路径是这样的，那么当我们操作路径为 A -go- B -go- C == A -push- B -push- C 因为我们在定义页面路由时已经将层级限制好了
///   但是如果我们在定义页面路径时是使用的
///   A: path = '/'
///   B: path = '/detail'
///   C: path = '/pay'
///   那么结果完全不同，因为我们在定义页面path的时候没有指定归属关系。所以当我们使用 A -go- B -go- C ,然后从C 返回时会直接返回A，因为C的parentPath是'/' 所以会直接返回到A
class _GoRouterDemoPageState extends State<GoRouterDemoPage> {

  List<String> _titles = ['跳转到详情页(push)','跳转到详情页(go)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GoRouter主页'),),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(title: Text(_titles[index],), onTap: () {
            if (index == 0) {
              _onTapPushToDetail();
            } else if (index == 1) {
              _onTapGoToDetail();
            }
          },);
        }, itemCount: _titles.length, itemExtent: 44,),
      ),
    );
  }

  _onTapPushToDetail() {
    context.push('/details');
  }

  _onTapGoToDetail() {
    context.go('/details');
  }
}
