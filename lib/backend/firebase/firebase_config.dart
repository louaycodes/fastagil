import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDY9aRx-KIsJVpYPvdWH503AiLrYTqOq0E",
            authDomain: "fast-agil.firebaseapp.com",
            projectId: "fast-agil",
            storageBucket: "fast-agil.firebasestorage.app",
            messagingSenderId: "952897211693",
            appId: "1:952897211693:web:a5135fa21ddd2f0a9997a4",
            measurementId: "G-410F08F81E"));
  } else {
    await Firebase.initializeApp();
  }
}
