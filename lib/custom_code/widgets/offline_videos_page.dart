// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class OfflineVideosPage extends StatefulWidget {
  final double? width;
  final double? height;

  const OfflineVideosPage({Key? key, this.width, this.height})
      : super(key: key);

  @override
  _OfflineVideosPageState createState() => _OfflineVideosPageState();
}

class _OfflineVideosPageState extends State<OfflineVideosPage> {
  List<File> videoFiles = []; // List to hold video files

  @override
  void initState() {
    super.initState();
    checkPermissionsAndFetchVideos();
  }

  Future<void> checkPermissionsAndFetchVideos() async {
    if (Platform.isAndroid || Platform.isIOS) {
      if (await _requestStoragePermissions()) {
        await fetchVideosFromDownloadsFolder();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Storage access is not supported on this platform.')),
      );
    }
  }

  Future<bool> _requestStoragePermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.isGranted) {
        return true;
      }

      final storagePermission = await Permission.storage.request();

      if (storagePermission.isGranted) {
        return true;
      }

      if (storagePermission.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please enable storage permission from settings.')),
        );
        await openAppSettings();
        return false;
      }

      return false;
    } else if (Platform.isIOS) {
      // iOS-specific: No additional permissions required for app directories
      return true;
    }

    return false;
  }

  Future<void> fetchVideosFromDownloadsFolder() async {
    try {
      Directory? downloadsDirectory;

      if (Platform.isAndroid) {
        final directories = await getExternalStorageDirectories(
            type: StorageDirectory.downloads);
        if (directories != null && directories.isNotEmpty) {
          downloadsDirectory = directories.first;
        }
      } else if (Platform.isIOS) {
        downloadsDirectory = await getApplicationDocumentsDirectory();
      }

      if (downloadsDirectory == null || !await downloadsDirectory.exists()) {
        print('Download directory is null or does not exist.');
        return;
      }

      final files = downloadsDirectory.listSync();

      final videoFilesFiltered = files
          .whereType<File>() // Ensure only files
          .where((file) =>
              file.path.endsWith('.mp4') || file.path.endsWith('.avi'))
          .toList();

      setState(() {
        videoFiles = videoFilesFiltered;
      });

      print('Videos found: ${videoFiles.map((file) => file.path).toList()}');
    } catch (e) {
      print('Error fetching videos from directory: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      body: Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: videoFiles.isNotEmpty
            ? ListView.builder(
                itemCount: videoFiles.length,
                itemBuilder: (context, index) {
                  final videoFile = videoFiles[index];
                  final fileName = videoFile.path.split('/').last;

                  return ListTile(
                    title: Text('Video ${index + 1}'),
                    subtitle: Text(fileName),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoFilePath: videoFile.path,
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : const Center(
                child: Text(
                  'No downloaded videos found.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final String videoFilePath;

  const VideoPlayerScreen({Key? key, required this.videoFilePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing Video'),
      ),
      body: Center(
        child: Text(
          'Play video from: $videoFilePath',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
