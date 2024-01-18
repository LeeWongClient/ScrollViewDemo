import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class GoRouterLastPage extends StatefulWidget {
  const GoRouterLastPage({super.key});

  @override
  State<GoRouterLastPage> createState() => _GoRouterLastPageState();
}

class _GoRouterLastPageState extends State<GoRouterLastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Go Router 测试'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: _onTapBack, child: Text('点击返回')),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }

  _onTapBack() {
    context.pop();
  }

}
