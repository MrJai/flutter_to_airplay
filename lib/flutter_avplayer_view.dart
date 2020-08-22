import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterAVPlayerView extends StatelessWidget {
  const FlutterAVPlayerView({
    Key key,
    this.urlString,
    this.filePath,
  })  : assert(urlString != null || filePath != null),
        super(key: key);

  final urlString;
  final filePath;

  Map getCreateParams() {
    if (urlString != null && urlString.length > 0) {
      return {
        'url': urlString,
      };
    } else {
      return {
        'file': filePath,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: 'flutter_avplayer_view',
      creationParams: getCreateParams(),
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
