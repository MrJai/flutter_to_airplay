import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// This widget returns a native view with an AVPlayer inside, backed by a
/// `UIView` on iOS and an `NSView` on macOS. It can be added as it is, or
/// inside a Container to limit and control its width and height.

class FlutterAVPlayerView extends StatelessWidget {
  const FlutterAVPlayerView({
    Key? key,
    this.urlString,
    this.filePath,
    this.assetPath,
    this.autoLoop = false,
    this.headers,
  }) : assert(urlString != null || filePath != null || assetPath != null);

  /// URL string for the video file, if the file is to be played from the network.
  final String? urlString;

  /// Asset name/path for the video file that needs to be played.
  final String? assetPath;

  /// File name/path for the video file that needs to be played from the Temporary or Document directory.
  final String? filePath;

  /// Boolean to enable/disable autoLoop
  final bool autoLoop;

  /// Optional HTTP headers (e.g. `Authorization`) to send when requesting
  /// [urlString]. Only applicable when playing a network video.
  final Map<String, String>? headers;

  /// This function packs the available parameters to be sent to native code.
  /// It will check for the URL first, if it is available, then it will be used,
  /// otherwise filePath will be used.
  /// It is preferred that only one of urlString or filePath is used at a time,
  /// if both are provided, application will prioritise urlString.
  Map<String, dynamic> getCreateParams() {
    Map<String, dynamic> params = {
      'class': 'FlutterAVPlayerView',
    };

    if (urlString != null) {
      params['url'] = urlString;
      if (headers != null && headers!.isNotEmpty) {
        params['headers'] = headers;
      }
    } else if (filePath != null) {
      params['file'] = filePath;
    } else if (assetPath != null) {
      params['asset'] = assetPath;
    }

    params['autoLoop'] = autoLoop;
    return params;
  }

  @override
  Widget build(BuildContext context) {
    // This is the identifier that helps distinguish different views in the native code.
    const viewType = 'flutter_avplayer_view';

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        creationParams:
            getCreateParams(), // parameters to load the video in native code.
        creationParamsCodec:
            StandardMessageCodec(), // messenger to decode message between flutter and native.
      );
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return AppKitView(
        viewType: viewType,
        creationParams: getCreateParams(),
        creationParamsCodec: StandardMessageCodec(),
      );
    } else {
      // if the platform is unsupported, return a centered text widget with a message.
      return const Center(
        child: Text('Only iOS and macOS are supported at this moment.'),
      );
    }
  }
}
