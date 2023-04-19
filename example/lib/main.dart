import 'package:flutter/material.dart';
import 'package:flutter_to_airplay_example/customIcon/custom_icon_view.dart';
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
