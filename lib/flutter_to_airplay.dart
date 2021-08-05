export 'airplay_route_picker_view.dart';
export 'flutter_avplayer_view.dart';

import 'dart:async';

import 'package:flutter/services.dart';

/// For now this class provides on method to check iOS version.
class FlutterToAirplay {
  // returns a method channel for given name
  static const MethodChannel _channel =
      const MethodChannel('flutter_to_airplay');

  /// Invokes a native method [getPlatformVersion] to get iOS version.
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
