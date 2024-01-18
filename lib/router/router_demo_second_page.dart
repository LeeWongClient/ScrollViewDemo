import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/router/router_demo_third_page.dart';

class RouterDemoSecondPage extends StatefulWidget {
  const RouterDemoSecondPage({super.key, this.param});
  final Map<String, String>? param;
  @override
  State<RouterDemoSecondPage> createState() => _RouterDemoSecondPageState();
}

class _RouterDemoSecondPageState extends State<RouterDemoSecondPage> {

  String? result;

  @override
  Widget build(BuildContext context) {
    var hasParam = widget.param != null;
    var hasResult = result != null;
    return Scaffold(
      appBar: AppBar(title: const Text('第二个页面'),),
      body: Center(
        child: Column(
          children: [
            hasParam ? Text('从上个页面带过来的参数是: ${widget.param?['name'] ?? ''}') : Container(),
            hasParam ? const SizedBox(height: 50,) : const SizedBox(height: 0,),
            TextButton(onPressed: _onTapNext, child: const Text('跳转到下一级')),
            const SizedBox(height: 30,),
            TextButton(onPressed: _onTapTwoPop, child: const Text('返回上一级')),
            const SizedBox(height: 100,),
            TextButton(onPressed: _onTapRouterConfigNext, child: const Text('跳转到下一级(routerConfig)')),
            const SizedBox(height: 30,),
            hasResult ? Text('这是从上一个页面获取到的返回值: $result') : Container(),

          ],
        ),
      ),
    );
  }

  _onTapNext() async {
    var res = await Navigator.push(context, MaterialPageRoute(settings: const RouteSettings(name: 'RouterDemoThirdPage'), builder: (context) => const RouterDemoThirdPage()));
    print(res ?? '没有返回值');
    setState(() {
      result = res as String?;
    });
  }

  _onTapTwoPop() {
    Navigator.of(context).pop();
  }

  _onTapRouterConfigNext() async {
    var res = await Navigator.pushNamed(context, '/page3',);
    print(res ?? '没有返回值');
    setState(() {
      result = res as String?;
    });
  }
}
