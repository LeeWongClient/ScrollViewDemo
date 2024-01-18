import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class GoRouterDetailPage extends StatefulWidget {
  const GoRouterDetailPage({super.key, this.params});
  final Map<String, String>? params;
  @override
  State<GoRouterDetailPage> createState() => _GoRouterDetailPageState();
}

class _GoRouterDetailPageState extends State<GoRouterDetailPage> {
  List<String> _titles = ['跳转到下一页(push)', '跳转到下一页(go)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Go Router Detail Page param ${widget.params?['name'] ?? ''}', style: TextStyle(fontSize: 13),),),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(title: Text(_titles[index],), onTap: () {
            if (index == 0) {
              _onTapPushNext();
            } else if (index == 1) {
              _onTapGoNext();
            }
          },);
        }, itemCount: _titles.length, itemExtent: 44,),
      ),
    );
  }

  _onTapGoNext() {
    context.go('/last');
  }

  _onTapPushNext() {
    context.push('/last');
  }
}
