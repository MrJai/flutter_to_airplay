import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

enum FlutterAVPlayerStatus {
  unknown,
  playing,
  paused,
}

/// This widget returns a UIView from swift with an AVPlayer inside,
/// it can be added as it is, or inside a Container to limit
/// and control its width and height.

class FlutterAVPlayerView extends StatelessWidget {
  const FlutterAVPlayerView({
    Key? key,
    this.urlString,
    this.assetPath,
    this.filePath,
    this.onStatusChanged,
  })  : assert(urlString != null || filePath != null || assetPath != null),
        super(key: key);

  final Function(FlutterAVPlayerStatus)? onStatusChanged;

  /// URL string for the video file, if the file is to be played from the network.
  final String? urlString;

  /// File path for the video file, if the file is to be played from the device.
  final String? filePath;

  /// Asset name/path for the video file that needs to be played.
  final String? assetPath;

  /// This function packs the available parameters to be sent to native code.
  /// It will check for the URL first, if it is available, then it will be used,
  /// otherwise filePath will be used.
  /// It is preferred that only one of urlString or filePath is used at a time,
  /// if both are provided, application will prioritise urlString.
  Map getCreateParams() {
    Map params = {
      'class': 'FlutterAVPlayerView',
    };
    if (urlString != null && urlString!.length > 0) {
      params['url'] = urlString;
    } else if (assetPath != null && assetPath!.length > 0) {
      params['asset'] = assetPath;
    } else {
      params['file'] = filePath;
    }
    return params;
  }

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType:
          'flutter_avplayer_view', // This is the identifier that helps distinguish different views in the native code.
      creationParams:
          getCreateParams(), // parameters to load the video in native code.
      creationParamsCodec:
          StandardMessageCodec(), // messenger to decode message between flutter and native.
      onPlatformViewCreated:
          _onPlatformViewCreated, // callback to listen to events from native code.
    );
  }

  void _onPlatformViewCreated(int id) {
    final MethodChannel channel =
        MethodChannel('plugins.mcrovero/flutter_avplayer_view_$id');
    channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onStatusChanged':
          String status = call.arguments['status'];
          FlutterAVPlayerStatus avPlayerStatus = FlutterAVPlayerStatus.values
              .firstWhere(
                  (e) => e.toString() == 'FlutterAVPlayerStatus.$status');
          if (onStatusChanged != null) {
            onStatusChanged!(avPlayerStatus);
          }
          break;
        default:
          throw MissingPluginException();
      }
    });
  }
}
