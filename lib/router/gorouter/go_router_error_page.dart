import 'package:flutter/material.dart';

class GoRouterErrorPage extends StatelessWidget {
  const GoRouterErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('错误页面'),),
      body: Center(
        child: Container(
          width: 300,
          child: Center(
            child: const Text('当你到达这个页面的时候，就说明你走错地方了，重新检查下你的路由配置吧', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),),
          ),
        ),
      ),
    );
  }
}
