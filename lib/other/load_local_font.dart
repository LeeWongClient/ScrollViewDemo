import 'package:flutter/material.dart';

class LoadLocalFontPage extends StatefulWidget {
  const LoadLocalFontPage({super.key});

  @override
  State<LoadLocalFontPage> createState() => _LoadLocalFontPageState();
}

class _LoadLocalFontPageState extends State<LoadLocalFontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('加载本地字体'),),
      body: Center(
        child: Column(
          children: [
            Text('AliPHT-B', style: TextStyle(fontSize: 18, fontFamily:"AliPHT-B"),),
            SizedBox(height: 10,),
            Text('AliPHT-H', style: TextStyle(fontSize: 18,fontFamily:"AliPHT-H"),),
            SizedBox(height: 10,),
            Text('AliPHT-R', style: TextStyle(fontSize: 18,fontFamily:"AliPHT-R"),),
            SizedBox(height: 10,),
            Text('AliPHT-M', style: TextStyle(fontSize: 18,fontFamily:"AliPHT-M"),),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
