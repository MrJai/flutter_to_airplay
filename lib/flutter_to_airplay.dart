import 'dart:async';

import 'package:flutter/services.dart';

class FlutterToAirplay {
  // returns a method channel for given name
  static const MethodChannel _channel =
      const MethodChannel('flutter_to_airplay');

  // invokes a native method [getPlatformVersion] to get iOS version.
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
