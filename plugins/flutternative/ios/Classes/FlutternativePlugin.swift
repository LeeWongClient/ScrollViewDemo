import Flutter
import UIKit

public class FlutternativePlugin: NSObject, FlutterPlugin {

    // 事件监听
    var eventSink: FlutterEventSink?
    
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_native", binaryMessenger: registrar.messenger())
    let eventChannel = FlutterEventChannel(name: "flutter_native/event", binaryMessenger: registrar.messenger())
      
    eventChannel.setStreamHandler(TimerStreamHandler())
      
    let instance = FlutternativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "phoneVibrate":
         let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        // 触发振动
        impactFeedbackGenerator.impactOccurred()
      print("触发手机振动")
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

//
//extension FlutternativePlugin {
//    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
//        if eventSink == nil {
//            self.eventSink = events
//            // 拼装数据
//            let dict = ["key":"value"]
//            eventSink?(dict)
//            
//        }
//        return nil
//    }
//    
//    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
//        eventSink = nil
//        return nil
//    }
//}
