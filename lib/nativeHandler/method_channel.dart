import 'package:flutter/material.dart';
import 'package:flutternative/src/flutter_native_communication.dart';
class MethodChannelPage extends StatefulWidget {
  const MethodChannelPage({super.key});

  @override
  State<MethodChannelPage> createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativePlugin.listenToiOSMsg( (model) {
      if(model.methodName == "showFlutterAlert") {
        var msg = model.arguments as String ?? "";
        _alertOnView(msg);
      }
      return Future.value(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Method Channel 双向通讯'),),
      body: Center(
        child: TextButton(onPressed: _onTapSendMsgToiOS, child: Text('调用原生弹出iOS弹窗AlertController')),
      ),
    );
  }

  _onTapSendMsgToiOS() {
    FlutterNativePlugin.sendMsgToiOS("flutter 调用Native 让Native弹窗");
  }

  _alertOnView(String msg) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('来了来了'),
        content: Text(msg),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('取消')),
        ],
      );
    });
  }
}
