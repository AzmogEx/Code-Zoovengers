import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAV_5TrgxtpQAug_ocCMz8kGeTopqYsJV0",
            authDomain: "zoovengers-af11d.firebaseapp.com",
            projectId: "zoovengers-af11d",
            storageBucket: "zoovengers-af11d.appspot.com",
            messagingSenderId: "1062578843311",
            appId: "1:1062578843311:web:58e3ee664abce5eb5d2e5a",
            measurementId: "G-M4KYJ54HKH"));
  } else {
    await Firebase.initializeApp();
  }
}
