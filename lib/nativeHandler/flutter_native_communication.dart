import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/nativeHandler/method_channel.dart';
import 'package:flutter_ui_demo/nativeHandler/network_listener.dart';
import 'package:flutter_ui_demo/nativeHandler/timer_listener.dart';
import 'package:flutternative/src/flutter_native_communication.dart';

class FlutterNativeCommunicationPage extends StatefulWidget {
  const FlutterNativeCommunicationPage({super.key});

  @override
  State<FlutterNativeCommunicationPage> createState() => _FlutterNativeCommunicationPageState();
}

class _FlutterNativeCommunicationPageState extends State<FlutterNativeCommunicationPage> {

  final List<String> _titles = ['点击手机振动', '监听 native timer', '监听手机网络状况', '双向通讯'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('与Native交互'),),
      body:  Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(title: Text(_titles[index],), onTap: () {
            if (index == 0) {
              _onTapVibratePhone();
            } else if (index == 1) {
              _onTapTimerListen();
            } else if (index == 2) {
              _onTapNetworkListen();
            } else if (index == 3) {
              _onTapBothSide();
            }
          },);
        }, itemCount: _titles.length, itemExtent: 44,),
      ),
    );
  }

  _onTapVibratePhone() {
    FlutterNativePlugin.phoneVibrate();
  }

  _onTapTimerListen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
  }

  _onTapNetworkListen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkListener()));
  }

  _onTapBothSide() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MethodChannelPage()));
  }
}
