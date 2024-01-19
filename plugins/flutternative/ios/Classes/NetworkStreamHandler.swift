//
//  NetworkStreamHandler.swift
//  flutternative
//
//  Created by LeeWong on 2024/1/19.
//

import Foundation
import UIKit
import Flutter
import Alamofire

class NetworkStreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    
    private let manager = NetworkReachabilityManager()
    func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = eventSink
        startMonitoring()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        stopMonitoring()
        return nil
    }

    
    func startMonitoring() {
        manager?.startListening(onUpdatePerforming: { [weak self] status in
            var title = "未知"
            switch status {
            case .notReachable:
                title = "无网络"
            case .reachable(let type):
                if type == .ethernetOrWiFi {
                    title = "WI-FI"
                } else if type == .cellular {
                    title = "移动蜂窝网络"
                }
            default:
                break
            }
            self?.eventSink?(title)
        })
    }
    
    func stopMonitoring() {
        manager?.stopListening()
    }
}
