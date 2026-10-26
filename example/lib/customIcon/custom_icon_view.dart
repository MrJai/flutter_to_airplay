import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';

class CustomIconView extends StatelessWidget {
  const CustomIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter 2 Airplay',
            style: TextStyle(
              color: Colors.blueGrey.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blueGrey.shade400,
            ),
          ),
          actions: [
            SizedBox(
              width: 44.0,
              height: 44.0,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.blueGrey.shade400,
                    ),
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
              assetPath: 'assets/videos/butterfly.mp4',
            ),
          ),
        ),
      ),
    );
  }
}
