import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:path_provider/path_provider.dart';

class PickFromFileView extends StatefulWidget {
  @override
  State<PickFromFileView> createState() => _PickFromFileViewState();
}

class _PickFromFileViewState extends State<PickFromFileView> {
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _setUpFile();
  }

  Future<void> _setUpFile() async {
    final String? savedFile = await _getSaveFile('assets/videos/butterfly.mp4');
    if (savedFile != null) {
      setState(() {
        _filePath = savedFile;
      });
    } else {
      final String savedFile =
          await _saveAssetToTempDirectory('assets/videos/butterfly.mp4');
      setState(() {
        _filePath = savedFile;
      });
    }
  }

  Future<String?> _getSaveFile(String assetPath) async {
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/temp_video.mp4');

    if (tempFile.existsSync()) {
      return tempFile.path;
    } else {
      return null;
    }
  }

  Future<String> _saveAssetToTempDirectory(String assetPath) async {
    // Get the temporary directory
    Directory tempDir = await getTemporaryDirectory();

    // Load the asset
    ByteData data = await rootBundle.load(assetPath);

    // Create a file in the temporary directory
    File tempFile = File('${tempDir.path}/temp_video.mp4');

    // Write the asset data to the file
    await tempFile.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

    // Return the file path
    return tempFile.path;
  }

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
            child: _filePath == null
                ? const CircularProgressIndicator()
                : FlutterAVPlayerView(
                    filePath: _filePath,
                  ),
          ),
        ),
      ),
    );
  }
}
