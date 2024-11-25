// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io'; // For platform-specific checks
import 'package:flutter/material.dart'; // For user feedback (SnackBars)
import 'package:permission_handler/permission_handler.dart'; // For runtime permissions
import 'package:dio/dio.dart'; // For file downloading
import 'package:path_provider/path_provider.dart'; // To get app directory paths
import 'package:hive/hive.dart'; // For persistent file path storage

Future<void> videoOfflineUse(
    BuildContext context, String videoUrl, String fileName) async {
  final dio = Dio(); // Create Dio instance for downloading files

  try {
    // Handle permissions for Android/iOS
    if (Platform.isAndroid || Platform.isIOS) {
      print('Requesting storage permission...'); // Debugging log

      // Request storage permission
      PermissionStatus status = await Permission.storage.request();

      // Handle permission statuses
      if (status.isGranted) {
        print('Permission granted.');
      } else if (status.isDenied) {
        print('Permission denied.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Storage permission denied. Please grant permissions to download videos.',
            ),
          ),
        );
        return;
      } else if (status.isPermanentlyDenied) {
        print('Permission permanently denied.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Storage permission permanently denied. Redirecting to app settings.',
            ),
          ),
        );
        await openAppSettings(); // Redirect user to app settings
        return;
      } else if (status.isRestricted) {
        print('Permission restricted (iOS-specific).');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Storage permission is restricted. Please check your device settings.',
            ),
          ),
        );
        return;
      }
    }

    // Get the application directory for saving files
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String savePath = '${appDocDir.path}/$fileName';

    print('Saving file to: $savePath'); // Debugging log

    // Check if the file already exists
    final file = File(savePath);
    if (file.existsSync()) {
      print('File already exists at: $savePath');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File already exists.')),
      );
      return; // Skip downloading if the file already exists
    }

    // Notify the user that the download has started
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download started...')),
    );

    // Start downloading the file
    await dio.download(
      videoUrl,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          double progress = (received / total * 100);
          print('Download Progress: $progress%'); // Debugging log
        }
      },
    );

    print('File downloaded to: $savePath');

    // Save the file path to Hive for persistence
    final box = await Hive.openBox<String>('videos'); // Open the Hive box
    box.put(fileName, savePath); // Save the file path with its name
    print('File path saved in Hive: $savePath');

    // Notify the user that the download is complete
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download complete!')),
    );
  } catch (e) {
    // Handle and log any errors during the download process
    print('Error downloading file: $e'); // Debugging log
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error downloading file: $e')),
    );
  }
}
