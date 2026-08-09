//
//  FlutterRoutePickerView.swift
//  flutter_to_airplay
//
//  Created by Junaid Rehmat on 22/08/2020.
//

import Foundation
import AVKit
import FlutterMacOS

class FlutterRoutePickerView: NSView, AVRoutePickerViewDelegate {
    private let _picker: AVRoutePickerView
    private let _methodChannel: FlutterMethodChannel

    init(
        messenger: FlutterBinaryMessenger,
        viewId: Int64,
        arguments: Dictionary<String, Any>
    ) {
        _picker = AVRoutePickerView(frame: NSRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
        _methodChannel = FlutterMethodChannel(
            name: "flutter_to_airplay#\(viewId)", binaryMessenger: messenger)
        super.init(frame: NSRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))

        // Match the borderless look of the iOS picker button.
        _picker.isRoutePickerButtonBordered = false

        if let tintColor = arguments["tintColor"] as? Dictionary<String, Any>,
            let color = FlutterRoutePickerView.mapToColor(tintColor) {
            _picker.setRoutePickerButtonColor(color, for: .normal)
        }
        if let activeTintColor = arguments["activeTintColor"] as? Dictionary<String, Any>,
            let color = FlutterRoutePickerView.mapToColor(activeTintColor) {
            _picker.setRoutePickerButtonColor(color, for: .active)
        }

        _picker.delegate = self
        _picker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_picker)
        NSLayoutConstraint.activate([
            _picker.leadingAnchor.constraint(equalTo: leadingAnchor),
            _picker.trailingAnchor.constraint(equalTo: trailingAnchor),
            _picker.topAnchor.constraint(equalTo: topAnchor),
            _picker.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func mapToColor(_ map: Dictionary<String, Any>) -> NSColor? {
        guard let red = map["red"] as? NSNumber,
            let green = map["green"] as? NSNumber,
            let blue = map["blue"] as? NSNumber,
            let alpha = map["alpha"] as? NSNumber
        else {
            return nil
        }
        return NSColor(
            red: CGFloat(truncating: red),
            green: CGFloat(truncating: green),
            blue: CGFloat(truncating: blue),
            alpha: CGFloat(truncating: alpha))
    }

    func routePickerViewWillBeginPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        _methodChannel.invokeMethod("onShowPickerView", arguments: nil)
    }

    func routePickerViewDidEndPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        _methodChannel.invokeMethod("onClosePickerView", arguments: nil)
    }
}
