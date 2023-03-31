import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:flutter_to_airplay_example/customIcon/custom_icon_view.dart';
import 'package:flutter_to_airplay_example/pickFromFile/pick_from_file_view.dart';
import 'package:flutter_to_airplay_example/pickFromURL/pick_from_url_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterToAirplay.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Flutter 2 Airplay'),
              Text(
                _platformVersion,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickFromFileView(),
                        ),
                      ),
                      title: Text('Video from File'),
                      trailing: Icon(Icons.chevron_right),
                    );
                    break;
                  case 1:
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickFromURLView(),
                        ),
                      ),
                      title: Text('Video from URL'),
                      trailing: Icon(Icons.chevron_right),
                    );
                    break;
                  case 2:
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomIconView(),
                        ),
                      ),
                      title: Text('Custom Icon'),
                      trailing: Icon(Icons.chevron_right),
                    );
                    break;
                  default:
                    return null;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
