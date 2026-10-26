//
//  SharePlatformViewFactory.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import Foundation
import FlutterMacOS

class SharePlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    let _messenger : FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        _messenger = messenger
    }

    func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
        let arguments = args as? Dictionary<String, Any> ?? [:]
        if let viewClass = arguments["class"] as? String, viewClass == "AirplayRoutePicker" {
            return FlutterRoutePickerView(messenger: _messenger, viewId: viewId, arguments: arguments)
        }

        return NSView()
    }

    func createArgsCodec() -> (FlutterMessageCodec & NSObjectProtocol)? {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
