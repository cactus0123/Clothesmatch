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
    apiKey: 'AIzaSyD-xjCTykVWduXw17TEzIOiD98yFOjGLhQ',
    appId: '1:446824727271:web:8f4e39edf41f58592f1842',
    messagingSenderId: '446824727271',
    projectId: 'new-afg',
    authDomain: 'new-afg.firebaseapp.com',
    storageBucket: 'new-afg.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0MlfVXPt8DSNn3Ly4HEbYHcLnsH-pQ6w',
    appId: '1:446824727271:android:9d720929722bbf582f1842',
    messagingSenderId: '446824727271',
    projectId: 'new-afg',
    storageBucket: 'new-afg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDATbBfNjrJ-oQ_Ce90wxcl-Cj1gayx7PM',
    appId: '1:446824727271:ios:1379cd4fa45930da2f1842',
    messagingSenderId: '446824727271',
    projectId: 'new-afg',
    storageBucket: 'new-afg.appspot.com',
    iosBundleId: 'com.example.clothesmatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDATbBfNjrJ-oQ_Ce90wxcl-Cj1gayx7PM',
    appId: '1:446824727271:ios:97c3fc0e1441afbc2f1842',
    messagingSenderId: '446824727271',
    projectId: 'new-afg',
    storageBucket: 'new-afg.appspot.com',
    iosBundleId: 'com.example.clothesmatch.RunnerTests',
  );
}