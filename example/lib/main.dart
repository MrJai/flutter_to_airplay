import 'package:flutter/material.dart';
import 'package:flutter_to_airplay_example/customIcon/custom_icon_view.dart';
import 'package:flutter_to_airplay_example/pickFromAsset/pick_from_asset_view.dart';
import 'package:flutter_to_airplay_example/pickFromFile/pick_from_file_view.dart';
import 'package:flutter_to_airplay_example/pickFromURL/pick_from_url_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter 2 Airplay'),
        ),
        body: SafeArea(
          child: Container(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickFromAssetView(),
                        ),
                      ),
                      title: Text('Video from Asset'),
                      trailing: Icon(Icons.chevron_right),
                    );
                  case 1:
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
                  case 2:
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
                  case 3:
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
