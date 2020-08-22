import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AirPlayRoutePickerView extends StatelessWidget {
  const AirPlayRoutePickerView({
    Key key,
    this.tintColor,
    this.activeTintColor,
    this.backgroundColor,
  }) : super(key: key);

  final Color tintColor;
  final Color activeTintColor;
  final Color backgroundColor;

  Map getCreateParams() {
    Map creationParams = {};

    if (tintColor != null) {
      var tint = {};
      tint['red'] = tintColor.red;
      tint['green'] = tintColor.green;
      tint['blue'] = tintColor.blue;
      tint['alpha'] = tintColor.opacity;
      creationParams['tintColor'] = tint;
    }

    if (activeTintColor != null) {
      var tint = {};
      tint['red'] = activeTintColor.red;
      tint['green'] = activeTintColor.green;
      tint['blue'] = activeTintColor.blue;
      tint['alpha'] = activeTintColor.alpha;
      creationParams['activeTintColor'] = tint;
    }

    if (backgroundColor != null) {
      var tint = {};
      tint['red'] = backgroundColor.red;
      tint['green'] = backgroundColor.green;
      tint['blue'] = backgroundColor.blue;
      tint['alpha'] = backgroundColor.alpha;
      creationParams['backgroundColor'] = tint;
    }

    return creationParams;
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'airplay_route_picker_view',
        creationParamsCodec: StandardMessageCodec(),
        creationParams: getCreateParams(),
      );
    } else {
      return Center(
        child: Text('Only iOS is supported at this moment.'),
      );
    }
  }
}
