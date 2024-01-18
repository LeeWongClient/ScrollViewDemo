import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/gorouter/go_router_last_page.dart';
import 'package:flutter_ui_demo/router/gorouter/go_router_observer.dart';
import 'package:go_router/go_router.dart';

import 'go_router_detail_page.dart';
import 'go_router_error_page.dart';

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
                final params = state.uri.queryParameters;
                return GoRouterDetailPage(params: params,);
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
      errorBuilder: (context, state) => GoRouterErrorPage(),
      redirect: (context, state) {
        /// 这里可进行一些重定向操作，比如登录检查 隐私协议检查
        print('每一次的页面跳转都会调用这个方法,本次跳转是要跳转到 ${state.uri.path}');
        if (state.uri.path == '/list') {
          print('没有权限进入到这个页面，重定向到详情页面');
          return '/details';
        }
        return null;
      },
      observers: [GoRouterPathObserver()],
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
///   我们一般情况下页面跳转是不可预支的，因此大部分都是后面这种定义，因此除非是点击返回后直接回到主页面否则一般不用go
class _GoRouterDemoPageState extends State<GoRouterDemoPage> {

  List<String> _titles = ['跳转到详情页(push)','跳转到详情页(go)', '跳转到详情页(携带参数)', '替换当前页面(replace)', '跳转到一个不存在的页面', '页面重定向'];

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
            } else if (index == 2) {
              _onTapPushDetailWithParam();
            } else if (index == 3) {
              _onTapReplace();
            } else if (index == 4) {
              _onTapNotExistPage();
            } else if (index == 5) {
              _onTapRedirect();
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

  _onTapPushDetailWithParam() {
    context.push('/details?name=LeeWong');
  }

  _onTapReplace() {
    context.replace('/details');
  }

  _onTapNotExistPage() {
    context.push('/notexist');
  }

  _onTapRedirect() {
    context.push('/list');
  }
}
