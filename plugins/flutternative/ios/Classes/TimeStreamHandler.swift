//
//  TimeStreamHandler.swift
//  flutternative
//
//  Created by LeeWong on 2024/1/19.
//

import Foundation
import UIKit
import Flutter

class TimerStreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    private var timer: Timer?

    func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = eventSink
        startTimer()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        stopTimer()
        return nil
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if let eventSink = self.eventSink {
                // 发送事件到 Flutter
                // 在这个示例中，我们发送一个计时器事件，事件内容是当前时间
                print("timer 开启")
                eventSink(Date().timeIntervalSince1970 * 1000)
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        eventSink = nil
    }
}
