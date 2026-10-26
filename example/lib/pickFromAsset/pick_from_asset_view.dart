import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:flutter_to_airplay_example/Utils/ui_utils.dart';

class PickFromAssetView extends StatelessWidget {
  const PickFromAssetView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: createAppBar(() => Navigator.pop(context)),
        body: SafeArea(
          child: Center(
            child: FlutterAVPlayerView(
              assetPath: 'assets/videos/butterfly.mp4',
            ),
          ),
        ),
      ),
    );
  }
}
