import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAV4eEu2mhBhzhoSK0wLKLVd87acYtjJYs",
            authDomain: "track-app-uxjczg.firebaseapp.com",
            projectId: "track-app-uxjczg",
            storageBucket: "track-app-uxjczg.appspot.com",
            messagingSenderId: "343953680965",
            appId: "1:343953680965:web:3365757e3b7cc322e8512c"));
  } else {
    await Firebase.initializeApp();
  }
}
