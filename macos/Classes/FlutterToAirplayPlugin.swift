import Cocoa
import FlutterMacOS

public class FlutterToAirplayPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    registrar.register(
      SharePlatformViewFactory(messenger: registrar.messenger),
      withId: "airplay_route_picker_view")

    registrar.register(
      SharePlatformViewFactory(messenger: registrar.messenger),
      withId: "flutter_avplayer_view")
  }
}
