import 'dart:async';
import 'dart:typed_data';
import 'package:flutternative/src/flutter_native_communication.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class FlutterSnapNativeDrawPage extends StatefulWidget {
  const FlutterSnapNativeDrawPage({super.key});

  @override
  State<FlutterSnapNativeDrawPage> createState() => _FlutterSnapNativeDrawPageState();
}

class _FlutterSnapNativeDrawPageState extends State<FlutterSnapNativeDrawPage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(milliseconds: 20), (timer) {
      _catpureTrick();
    });
  }


  _catpureTrick() {
    screenshotController.capture().then((value) {
      if(value != null) {
        FlutterNativePlugin.showImageData(value);
      }
    }).catchError((error){
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated GIF'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Screenshot(
              controller: screenshotController,
              child: Image.asset(
                'assets/images/kemusan.gif',
                width: 200,
                height: 200,
              ),
            ),
            TextButton(onPressed: () {

            }, child: Text('点击开始'))
          ]
        ),
      ),
    );
  }
}
