import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutternative/src/native_to_flutter_method.dart';

class FlutterNativePlugin {

  static const MethodChannel _channel = const MethodChannel('flutter_native');
  /// 单向通信 主要是用于flutter像原生注册一个监听(eventListener)
  /// 原生监听到要监听的内容发生变化之后及时通知flutter端去做修改
  /// 主要用于需要原生段来主动触发，flutter被动接受的场景
  static const EventChannel _eventChannel = const EventChannel('flutter_native/event');
  static const EventChannel _networkChannel = const EventChannel('flutter_native/network');

  /// 数据监听
  static timerEventListen({bool type = true, void Function(dynamic)? onEvent, Function? onError}) async {
    assert(onEvent != null);
    _eventChannel.receiveBroadcastStream(type).listen(onEvent, onError: onError);
  }

  /// 数据监听
  static networkEventListen({bool type = true, void Function(dynamic)? onEvent, Function? onError}) async {
    assert(onEvent != null);
    _networkChannel.receiveBroadcastStream(type).listen(onEvent, onError: onError);
  }

  /// 调用原生方法
  static Future<bool> phoneVibrate() async {
    return await _channel.invokeMethod("phoneVibrate");
  }

  static Future<bool> sendMsgToiOS(String msg) async {
    return await _channel.invokeMethod("showAlertMsg", msg);

  }

  static void listenToiOSMsg(Future<dynamic> Function(NativeToFlutterMethod method) onCall) async {
    _channel.setMethodCallHandler( (call) {
      print("method call from ios");
      print("method ${call.method}");
      print("method arguments ${call.arguments}");
      return onCall(NativeToFlutterMethod(methodName: call.method, arguments: call.arguments));
    });
  }
}
