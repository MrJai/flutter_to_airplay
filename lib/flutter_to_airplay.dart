
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterToAirplay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_to_airplay');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
