import 'package:flutter/material.dart';

class RouterDemoForthPage extends StatefulWidget {
  const RouterDemoForthPage({super.key});

  @override
  State<RouterDemoForthPage> createState() => _RouterDemoForthPageState();
}

class _RouterDemoForthPageState extends State<RouterDemoForthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第四个页面'),),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: _onTapBack, child: Text('返回上一级')),
          ],
        ),
      ),
    );
  }

  _onTapBack() {
    Navigator.of(context).pop();
  }
}
