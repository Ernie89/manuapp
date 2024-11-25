import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB8510vFOapdjD2f5l9Lj49dhcB-59TUU0",
            authDomain: "manu-projekt-rev2-v1sb4h.firebaseapp.com",
            projectId: "manu-projekt-rev2-v1sb4h",
            storageBucket: "manu-projekt-rev2-v1sb4h.firebasestorage.app",
            messagingSenderId: "233709542336",
            appId: "1:233709542336:web:f95135681e7e7cf6f20625"));
  } else {
    await Firebase.initializeApp();
  }
}
