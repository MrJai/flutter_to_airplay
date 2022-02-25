import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';

class CustomIconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter 2 Airplay'),
          leading: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              width: 44.0,
              height: 44.0,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.play_arrow),
                  ),
                  AirPlayRoutePickerView(
                    tintColor: Colors.transparent,
                    activeTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: FlutterAVPlayerView(
              filePath: 'assets/videos/butterfly.mp4',
              // urlString:
              //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
            ),
          ),
        ),
      ),
    );
  }
}
