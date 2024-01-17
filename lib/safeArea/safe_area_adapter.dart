import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeAreaAdapterPage extends StatefulWidget {
  const SafeAreaAdapterPage({super.key});

  @override
  State<SafeAreaAdapterPage> createState() => _SafeAreaAdapterPageState();
}

class _SafeAreaAdapterPageState extends State<SafeAreaAdapterPage> {

  bool _topSafe = false;
  bool _bottomSafe = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        top: _topSafe,
        bottom: _bottomSafe,
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: 200,
              color: Colors.red,
              child: Text('这是标题'),
            ),
            Container(
              width: screenSize.width,
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoSwitch(value: _topSafe, onChanged: (isOn) {
                    setState(() {
                      _topSafe = isOn;
                    });
                  }),
                  SizedBox(width: 10,),
                  Text('顶部安全区域'),
                ],
              ),
            ),
            Container(
              width: screenSize.width,
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoSwitch(value: _bottomSafe, onChanged: (isOn) {
                    setState(() {
                      _bottomSafe = isOn;
                    });
                  }),
                  SizedBox(width: 10,),
                  Text('底部安全区域'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                width: screenSize.width,
                height: screenSize.height - 28,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('这是页面尾部'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
