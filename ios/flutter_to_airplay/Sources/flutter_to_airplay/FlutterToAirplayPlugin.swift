import Flutter
import UIKit

public class SwiftFlutterToAirplayPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(
        SharePlatformViewFactory(messenger: registrar.messenger()),
        withId: "airplay_route_picker_view",
        gestureRecognizersBlockingPolicy: FlutterPlatformViewGestureRecognizersBlockingPolicy(rawValue: 0))
    
    registrar.register(
        SharePlatformViewFactory(messenger: registrar.messenger()),
        withId: "flutter_avplayer_view",
        gestureRecognizersBlockingPolicy: FlutterPlatformViewGestureRecognizersBlockingPolicy(rawValue: 0))
  }
}
