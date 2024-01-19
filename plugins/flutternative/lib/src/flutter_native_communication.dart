import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNativePlugin {

  static const MethodChannel _channel = const MethodChannel('flutter_native');
  /// 原生事件监听：如果你需要在 Flutter 中监听原生平台上发生的事件，比如传感器数据变化、网络状态变化、硬件按钮点击等，你可以使用 EventChannel 来建立一个事件通道，将原生平台上的事件传递到 Flutter 中。这样，你可以实时获取和处理原生平台上发生的事件。
  /// 原生回调通知：当原生平台上的某个操作完成时，你可能需要通知 Flutter 应用程序进行相应的处理。例如，当原生平台上的文件下载完成时，你可以使用 EventChannel 将下载完成的事件通知到 Flutter，以便刷新用户界面或执行其他操作。
  /// 实时数据传输：如果你需要在 Flutter 和原生平台之间进行实时数据传输，例如音频流、视频流等，EventChannel 可以作为一个双向通道，用于传递实时数据。你可以在 Flutter 和原生平台之间建立一个事件通道，通过流式传输的方式实时传递数据。
  /// 原生回调方法调用：有时你可能需要在 Flutter 中调用原生平台上的某个方法，并接收原生方法的回调结果。使用 EventChannel 可以建立一个双向通道，使得 Flutter 可以调用原生平台上的方法，并接收原生方法的回调结果，以便进行后续处理。
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
}
