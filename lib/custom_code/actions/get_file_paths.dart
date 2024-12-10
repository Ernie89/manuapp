// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';

Future<String?> getFilePaths(String fileName) async {
  try {
    // Use path_provider to get the correct directory
    final directory = await getApplicationDocumentsDirectory();

    // Construct the full file path
    final String filePath = '${directory.path}/$fileName';

    print('File path: $filePath'); // Debugging output
    return filePath;
  } catch (e) {
    print('Error getting file path: $e');
    return null;
  }
}
