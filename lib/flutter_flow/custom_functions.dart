import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? fileName() {
  String getFileNameFromUrl(String url) {
    return url.split('/').last;
  }
}

String? getFilePath() {
  String getFilePath(String fileName) {
    // Replace this with the directory where your files are stored
    const String downloadDirectory = '/storage/emulated/0/Download';

    // Construct the full file path
    final String filePath = '$downloadDirectory/$fileName';

    return filePath;
  }
}
