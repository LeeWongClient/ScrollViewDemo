import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNativePlugin {
  static const MethodChannel _channel = const MethodChannel('flutter_native');
  static const EventChannel _eventChannel = const EventChannel('flutter_native');

  /// 数据监听
  static eventListen({bool type = true, void Function(dynamic)? onEvent, Function? onError}) async {
    assert(onEvent != null);
    _eventChannel.receiveBroadcastStream(type).listen(onEvent, onError: onError);
  }

  /// 调用原生方法
  static Future<bool> popPageIfExist() async {
    return await _channel.invokeMethod("phoneVibrate");
  }
}
