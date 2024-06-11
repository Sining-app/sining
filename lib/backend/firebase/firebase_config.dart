import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCkcWn5VVfL-2pE-m5Bmn_FE9Xb8jZTrqw",
            authDomain: "sining-23ca9.firebaseapp.com",
            projectId: "sining-23ca9",
            storageBucket: "sining-23ca9.appspot.com",
            messagingSenderId: "20924254455",
            appId: "1:20924254455:web:c86fea5da5d599756fabf2",
            measurementId: "G-TD6KZM26SM"));
  } else {
    await Firebase.initializeApp();
  }
}
