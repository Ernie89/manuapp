// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:hive/hive.dart';
import 'package:pod_player/pod_player.dart';

class OfflineVideosPage extends StatefulWidget {
  final double? width;
  final double? height;

  const OfflineVideosPage({Key? key, this.width, this.height})
      : super(key: key);

  @override
  _OfflineVideosPageState createState() => _OfflineVideosPageState();
}

class _OfflineVideosPageState extends State<OfflineVideosPage> {
  late Box<String> videosBox;

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  Future<void> loadVideos() async {
    try {
      videosBox = await Hive.openBox<String>('videos');
      print('Videos loaded from Hive: ${videosBox.values.toList()}');
    } catch (e) {
      print('Error loading videos from Hive: $e');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Videos'),
      ),
      body: videosBox.isNotEmpty
          ? ListView.builder(
              itemCount: videosBox.length,
              itemBuilder: (context, index) {
                final fileName = videosBox.keyAt(index) as String;
                final filePath = videosBox.get(fileName) as String;

                // Check if the file exists
                if (!File(filePath).existsSync()) {
                  return ListTile(
                    title: Text('Video ${index + 1} (Missing)'),
                    subtitle: Text('File path: $filePath'),
                    trailing: const Icon(Icons.error, color: Colors.red),
                  );
                }

                return ListTile(
                  title: Text('Video ${index + 1}'),
                  subtitle: Text(filePath),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerScreen(videoFilePath: filePath),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(
              child: Text(
                'No downloaded videos available. Download videos first to see them here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoFilePath;

  const VideoPlayerScreen({Key? key, required this.videoFilePath})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.file(File(widget.videoFilePath)),
    )..initialise();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: PodVideoPlayer(controller: _controller),
      ),
    );
  }
}
