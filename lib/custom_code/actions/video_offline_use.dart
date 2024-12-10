// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/material.dart'; // For SnackBars and context
import 'package:dio/dio.dart'; // For downloading files
import 'package:path_provider/path_provider.dart'; // For app-specific directories
import 'package:hive/hive.dart'; // For persistent file storage
import 'package:permission_handler/permission_handler.dart'; // For runtime permissions

Future<void> videoOfflineUse(
    BuildContext context, String videoUrl, String fileName) async {
  final dio = Dio();

  try {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      print('Storage permission granted.');
    } else {
      print('Storage permission denied.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Storage permission denied. Please grant permissions to download videos.')),
      );
      return;
    }

    // Get app-specific directory
    final directory = await getApplicationDocumentsDirectory();
    final savePath = '${directory.path}/$fileName';

    print('Saving file to: $savePath');

    // Check if the file already exists
    final file = File(savePath);
    if (file.existsSync()) {
      print('File already exists at: $savePath');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('File already exists.')));
      return; // Skip downloading if the file already exists
    }

    // Start downloading the file
    await dio.download(
      videoUrl,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          double progress = (received / total * 100);
          print('Download Progress: $progress%');
        }
      },
    );

    print('File downloaded to: $savePath');

    // Save the file path in Hive for later use
    final box = await Hive.openBox<String>('videos');
    box.put(fileName, savePath);
    print('File path saved in Hive: $savePath');

    // Notify the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download complete!')),
    );
  } catch (e) {
    print('Error downloading file: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error downloading file: $e')),
    );
  }
}
