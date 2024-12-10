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
import 'package:hive/hive.dart';

import 'dart:io';
import 'package:hive/hive.dart';

Future<void> saveFileToHive(String fileName, String filePath) async {
  try {
    final box = await Hive.openBox<String>('videos');
    box.put(fileName, filePath);
    print('File saved to Hive: $filePath');
  } catch (e) {
    print('Error saving file to Hive: $e');
  }
}
