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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNE6Rz01Vl-k3YeEKuAb2sRg37chEUb9E',
    appId: '1:51674362520:android:004f448e95b4562021d6ed',
    messagingSenderId: '51674362520',
    projectId: 'digital-workspace-98717',
    databaseURL: 'https://digital-workspace-98717-default-rtdb.firebaseio.com',
    storageBucket: 'digital-workspace-98717.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCACEt7efMlFbDfuL6QCluwlwj-U6ryhgM',
    appId: '1:51674362520:ios:ddd729965ab9136221d6ed',
    messagingSenderId: '51674362520',
    projectId: 'digital-workspace-98717',
    databaseURL: 'https://digital-workspace-98717-default-rtdb.firebaseio.com',
    storageBucket: 'digital-workspace-98717.appspot.com',
    iosBundleId: 'com.example.firebaseDigitalWorkspace',
  );
}
