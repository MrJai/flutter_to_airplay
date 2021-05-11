import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// This widget returns an AirplayRoutePicker button from native code,
/// it can be added as a button or as an app bar icon, just like any widget.
class AirPlayRoutePickerView extends StatelessWidget {
  const AirPlayRoutePickerView({
    Key? key,
    this.tintColor,
    this.activeTintColor,
    this.backgroundColor,
  }) : super(key: key);

  /// All of the attributes of this widget will effect the appearance of the
  /// button that will assist integration of this button into any theme.

  /// Tint color can be provided as a Flutter color, it will update the
  /// tint color of the button in normal state.
  final Color? tintColor;

  /// Active Tint color can be provided as a flutter color, it will update
  /// the active tint color of the button when it is tapped.
  final Color? activeTintColor;

  /// Background color can be provided as a flutter color, it will update
  /// the background color of the button.
  final Color? backgroundColor;

  /// This function checks the presence of all the option attribute,
  /// and only packs the ones available. That helps the error handling
  /// in the native code.
  Map getCreateParams() {
    Map creationParams = {
      'class': 'AirplayRoutePicker',
    };

    // if tintColor is not provided, do not process this.
    if (tintColor != null) {
      var tint = {};
      tint['red'] = tintColor!.red;
      tint['green'] = tintColor!.green;
      tint['blue'] = tintColor!.blue;
      tint['alpha'] = tintColor!.opacity;
      creationParams['tintColor'] = tint;
    }

    // if activeTintColor is not provided, do not process this.
    if (activeTintColor != null) {
      var tint = {};
      tint['red'] = activeTintColor!.red;
      tint['green'] = activeTintColor!.green;
      tint['blue'] = activeTintColor!.blue;
      tint['alpha'] = activeTintColor!.alpha;
      creationParams['activeTintColor'] = tint;
    }

    // if backgroundColor is not provided, do not process this.
    if (backgroundColor != null) {
      var tint = {};
      tint['red'] = backgroundColor!.red;
      tint['green'] = backgroundColor!.green;
      tint['blue'] = backgroundColor!.blue;
      tint['alpha'] = backgroundColor!.alpha;
      creationParams['backgroundColor'] = tint;
    }

    // return the map of packed parameters to be sent to native code.
    return creationParams;
  }

  /// For now this widget only supports for iOS, so build method will check
  /// if the platform is iOS it will return the AirPlayRoutePicker as expected,
  /// otherwise it will return a Centered Text Widget with proper message.
  @override
  Widget build(BuildContext context) {
    // This widget supports only iOS for now, so here we are checking this explicitly.
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType:
            'airplay_route_picker_view', // This is the identifier that helps distinguish different views in the native code.
        creationParamsCodec:
            StandardMessageCodec(), // messenger to decode message between flutter and native.
        creationParams:
            getCreateParams(), // parameters to load the video in native code.
      );
    } else {
      // if the platform is not iOS, it should return a centered text widget to give the message.
      return Center(
        child: Text('Only iOS is supported at this moment.'),
      );
    }
  }
}
