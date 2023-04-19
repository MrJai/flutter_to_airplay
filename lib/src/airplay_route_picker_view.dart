import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_airplay/src/flutter_to_airplay.dart';

/// This widget returns an AirplayRoutePicker button from native code,
/// it can be added as a button or as an app bar icon, just like any widget.
class AirPlayRoutePickerView extends StatefulWidget {
  const AirPlayRoutePickerView({
    Key? key,
    this.prioritizesVideoDevices = false,
    this.tintColor,
    this.activeTintColor,
    this.backgroundColor,
    this.height = 44.0,
    this.width = 44.0,
    this.onShowPickerView,
    this.onClosePickerView,
  }) : super(key: key);

  /// Whether or not the route picker should sort video capable output devices to the top of the list.
  /// Setting this to `true` will cause the route picker view to show a videocentric icon.
  final bool prioritizesVideoDevices;

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

  /// Height of the container, that will just increase the tapable area of
  /// this button. By default the value is 44.0, but user can change it.
  final double height;

  /// Width of the container, that will just increase the tapable area of
  /// this button. By default the value is 44.0, but user can change it.
  final double width;

  /// The route picker view will start presenting routes to the user.
  final VoidCallback? onShowPickerView;

  /// The route picker view will finished presenting routes to the user.
  final VoidCallback? onClosePickerView;

  /// This function checks the presence of all the option attribute,
  /// and only packs the ones available. That helps the error handling
  /// in the native code.
  Map<String, dynamic> _createParams() {
    // return the map of packed parameters to be sent to native code.
    return <String, dynamic>{
      'class': 'AirplayRoutePicker',
      'prioritizesVideoDevices': prioritizesVideoDevices,

      // if tintColor is not provided, do not process this.
      if (tintColor != null) 'tintColor': FlutterToAirplay.colorToParams(tintColor!),

      // if activeTintColor is not provided, do not process this.
      if (activeTintColor != null)
        'activeTintColor': FlutterToAirplay.colorToParams(activeTintColor!),

      // if backgroundColor is not provided, do not process this.
      if (backgroundColor != null)
        'backgroundColor': FlutterToAirplay.colorToParams(backgroundColor!),
    };
  }

  @override
  State<AirPlayRoutePickerView> createState() => _AirPlayRoutePickerViewState();
}

class _AirPlayRoutePickerViewState extends State<AirPlayRoutePickerView> {
  MethodChannel? _methodChannel;

  @override
  void dispose() {
    _disposeChannel();
    super.dispose();
  }

  void _onPlatformViewCreated(int id) {
    final name = '${FlutterToAirplay.name}#$id';

    if (_methodChannel?.name != name) {
      _disposeChannel();
    }

    _methodChannel = MethodChannel(name);
    _methodChannel!.setMethodCallHandler(_onPlatformCall);
  }

  Future<dynamic> _onPlatformCall(MethodCall call) async {
    switch (call.method) {
      case 'onShowPickerView':
        widget.onShowPickerView?.call();
        break;
      case 'onClosePickerView':
        widget.onClosePickerView?.call();
        break;
    }
  }

  void _disposeChannel() {
    _methodChannel?.setMethodCallHandler(null);
    _methodChannel = null;
  }

  /// For now this widget only supports for iOS, so build method will check
  /// if the platform is iOS it will return the AirPlayRoutePicker as expected,
  /// otherwise it will return a Centered Text Widget with proper message.
  @override
  Widget build(BuildContext context) {
    // This widget supports only iOS for now, so here we are checking this explicitly.
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: UiKitView(
          // This is the identifier that helps distinguish different views in the native code.
          viewType: 'airplay_route_picker_view',
          // messenger to decode message between flutter and native.
          creationParamsCodec: const StandardMessageCodec(),
          // parameters to load the video in native code.
          creationParams: widget._createParams(),
          onPlatformViewCreated: _onPlatformViewCreated,
        ),
      );
    } else {
      // if the platform is not iOS, it should return a centered text widget to give the message.
      return Center(
        child: Text('Only iOS is supported at this moment.'),
      );
    }
  }
}
