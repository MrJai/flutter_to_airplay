//
//  SharePlatformViewFactory.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import Foundation
import Flutter

class SharePlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    var _messenger : FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger & NSObjectProtocol) {
        _messenger = messenger
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        if viewId == 1 {
            let pickerView = FlutterRoutePickerView(frame: frame, viewIdentifier: viewId, arguments: args as! Dictionary<String, Any>, binaryMessenger: _messenger)
            return pickerView
        }
        else
        {
            let pickerView = FlutterAVPlayer(frame: frame, viewIdentifier: viewId, arguments: args as! Dictionary<String, Any>, binaryMessenger: _messenger)
            return pickerView
        }
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
