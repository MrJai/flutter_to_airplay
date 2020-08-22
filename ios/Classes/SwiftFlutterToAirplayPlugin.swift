import Flutter
import UIKit

public class SwiftFlutterToAirplayPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_to_airplay", binaryMessenger: registrar.messenger())
    
    let instance = SwiftFlutterToAirplayPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    registrar.register(SharePlatformViewFactory.init(messenger: registrar.messenger()), withId: "airplay_route_picker_view", gestureRecognizersBlockingPolicy: FlutterPlatformViewGestureRecognizersBlockingPolicy(rawValue: 0))
    
    registrar.register(SharePlatformViewFactory.init(messenger: registrar.messenger()), withId: "flutter_avplayer_view", gestureRecognizersBlockingPolicy: FlutterPlatformViewGestureRecognizersBlockingPolicy(rawValue: 0))
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
