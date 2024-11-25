// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<void> testPermissionHandler(BuildContext context) async {
  print('Requesting storage permission...'); // Debug log

  // Request storage permission
  final status = await Permission.storage.request();

  if (status.isGranted) {
    print('Storage permission granted.'); // Debug log
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Storage permission granted.')),
    );
  } else if (status.isDenied) {
    print('Storage permission denied.'); // Debug log
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Storage permission denied.')),
    );
  } else if (status.isPermanentlyDenied) {
    print('Storage permission permanently denied.'); // Debug log
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Storage permission permanently denied. Redirecting to settings.'),
      ),
    );
    await openAppSettings(); // Redirect user to app settings
  } else if (status.isRestricted) {
    print('Storage permission is restricted (iOS-specific).'); // Debug log
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Storage permission is restricted.')),
    );
  }
}
