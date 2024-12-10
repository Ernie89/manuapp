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
import 'package:path_provider/path_provider.dart';

Future<List<String>> fetchDownloadedFiles() async {
  List<String> filePaths = [];

  try {
    // Get the correct directory based on the platform
    Directory? downloadsDirectory;

    if (Platform.isAndroid) {
      downloadsDirectory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      downloadsDirectory = await getApplicationDocumentsDirectory();
    }

    if (downloadsDirectory == null || !await downloadsDirectory.exists()) {
      print('Directory not found or does not exist.');
      return [];
    }

    // Get all files in the directory
    final files = downloadsDirectory.listSync();

    for (var file in files.whereType<File>()) {
      filePaths.add(file.path); // Add file paths to the list
    }

    return filePaths;
  } catch (e) {
    print('Error fetching files: $e');
    return [];
  }
}
