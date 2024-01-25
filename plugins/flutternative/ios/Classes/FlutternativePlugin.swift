import Flutter

public class FlutternativePlugin: NSObject, FlutterPlugin {

    // 事件监听
    var eventSink: FlutterEventSink?
    var eventChannel: FlutterMethodChannel?
    
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_native", binaryMessenger: registrar.messenger())
    
    let eventChannel = FlutterEventChannel(name: "flutter_native/event", binaryMessenger: registrar.messenger())
    let networkChannel = FlutterEventChannel(name: "flutter_native/network", binaryMessenger: registrar.messenger())

    eventChannel.setStreamHandler(TimerStreamHandler())
      networkChannel.setStreamHandler(NetworkStreamHandler())
      
    let instance = FlutternativePlugin()
      instance.eventChannel = channel
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      print("receive method call \(call.method)")
    switch call.method {
    case "phoneVibrate":
         let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        // 触发振动
        impactFeedbackGenerator.impactOccurred()
      print("触发手机振动")
      result(true)
    case "showAlertMsg":
        showAlertMsg(msg: call.arguments as? String)
        result(true)
    case "readFileAtPath":
        readFileAtPath(path: call.arguments as? String, result: result)
    case "showImageData":
        showImageData(data: (call.arguments as? [String: Any])?["data"] as? FlutterStandardTypedData)
        result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

    var imageView: UIImageView = UIImageView()
    
    private func showImageData(data: FlutterStandardTypedData?) {
        guard let imageData = data?.data, let image = UIImage(data: imageData) else {
                    print("Error decoding image data")
                    return
        }
        print("receive image image \(image.size)")
        imageView.image = image
        imageView.frame = CGRect(origin: CGPoint(x: 100, y: 500), size: CGSize(width: 200, height: 200))
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(imageView)
        
    }
    
    private func showAlertMsg(msg: String?)  {
        let alert = UIAlertController(title: "原生alert", message: "\(msg ?? "msg")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "知道了", style: .default))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
        addFlutterAlert()
    }

    private func readFileAtPath(path: String?, result: @escaping FlutterResult) {
        guard let filePath = path else {
            print("路径为空 不合法")
            return
        }
        if let content = try? String(contentsOfFile: filePath, encoding: .utf8) {
            print("原生获取到文件中的内容 \(content)")
            result(true)
        } else {
            result(false)
        }
    }

    private func addFlutterAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
            self?.eventChannel?.invokeMethod("showFlutterAlert", arguments: "Native 调用flutter 让flutter弹窗")
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
