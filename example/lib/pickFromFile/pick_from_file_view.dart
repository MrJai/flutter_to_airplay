import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';

class PickFromFileView extends StatelessWidget {
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
            AirPlayIconButton(),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: FlutterAVPlayerView(
              filePath: 'assets/videos/butterfly.mp4',
            ),
          ),
        ),
      ),
    );
  }
}
