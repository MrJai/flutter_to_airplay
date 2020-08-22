//
//  FlutterRoutePickerView.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import Foundation
import AVKit
import MediaPlayer
import Flutter

class FlutterRoutePickerView: NSObject, FlutterPlatformView {
    private var _flutterRoutePickerView : UIView;
    
    init(frame:CGRect,
              viewIdentifier: CLongLong,
              arguments: Dictionary<String, Any>,
              binaryMessenger: FlutterBinaryMessenger) {
        if #available(iOS 11.0, *) {
            let tempView = AVRoutePickerView(frame: .init(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
            if let tintColor = arguments["tintColor"] {
                let color = tintColor as! Dictionary<String, Any>
                tempView.tintColor = UIColor.init(red: color["red"] as! CGFloat,
                                                  green: color["green"] as! CGFloat,
                                                  blue: color["blue"] as! CGFloat,
                                                  alpha: color["alpha"] as! CGFloat)
            }
            if let tintColor = arguments["activeTintColor"] {
                let color = tintColor as! Dictionary<String, Any>
                tempView.activeTintColor = UIColor.init(red: color["red"] as! CGFloat,
                                                  green: color["green"] as! CGFloat,
                                                  blue: color["blue"] as! CGFloat,
                                                  alpha: color["alpha"] as! CGFloat)
            }
            if let tintColor = arguments["backgroundColor"] {
                let color = tintColor as! Dictionary<String, Any>
                tempView.backgroundColor = UIColor.init(red: color["red"] as! CGFloat,
                                                  green: color["green"] as! CGFloat,
                                                  blue: color["blue"] as! CGFloat,
                                                  alpha: color["alpha"] as! CGFloat)
            }
            
            _flutterRoutePickerView = tempView
        } else {
            let tempView = MPVolumeView(frame: .init(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
            tempView.showsVolumeSlider = false
            _flutterRoutePickerView = tempView
        }
    }
    func view() -> UIView {
        return _flutterRoutePickerView
    }
    
    
}
