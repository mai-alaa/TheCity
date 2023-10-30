// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDsfTtFSCUbt1kwrXPVkLkzw_-o1SFZaK0',
    appId: '1:372451722407:web:c3cc0926907df6f8f58782',
    messagingSenderId: '372451722407',
    projectId: 'thecity-4bd89',
    authDomain: 'thecity-4bd89.firebaseapp.com',
    storageBucket: 'thecity-4bd89.appspot.com',
    measurementId: 'G-D7KEER52JG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvsphUDq-yMB__i9vYMzE57UlZ4UM77qI',
    appId: '1:372451722407:android:a8cee81413155288f58782',
    messagingSenderId: '372451722407',
    projectId: 'thecity-4bd89',
    storageBucket: 'thecity-4bd89.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc4ExE0zkSXcKodn9n4qcs1yvxFus4pWg',
    appId: '1:372451722407:ios:c3ebb92ea51e60f6f58782',
    messagingSenderId: '372451722407',
    projectId: 'thecity-4bd89',
    storageBucket: 'thecity-4bd89.appspot.com',
    iosBundleId: 'com.example.cityApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc4ExE0zkSXcKodn9n4qcs1yvxFus4pWg',
    appId: '1:372451722407:ios:67b7424b4c54ed9df58782',
    messagingSenderId: '372451722407',
    projectId: 'thecity-4bd89',
    storageBucket: 'thecity-4bd89.appspot.com',
    iosBundleId: 'com.example.cityApp.RunnerTests',
  );
}