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
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  if (Platform.isAndroid || Platform.isIOS) {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      print('Storage permission granted.');
    } else if (status.isDenied) {
      print('Storage permission denied.');
    } else if (status.isPermanentlyDenied) {
      print(
          'Storage permission permanently denied. Redirecting to settings...');
      await openAppSettings(); // Redirect to settings
    }
  } else {
    print('Storage permission is not required on this platform.');
  }
}
