import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterAVPlayerView extends StatelessWidget {
  const FlutterAVPlayerView({
    Key key,
    this.urlString,
  }) : super(key: key);

  final urlString;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: 'flutter_avplayer_view',
      creationParams: {
        'url': urlString,
      },
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
