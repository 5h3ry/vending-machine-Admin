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
    apiKey: 'AIzaSyBR5D6qWHaWAKDYWJgAmDnxQBChNa4JLDQ',
    appId: '1:67582534550:web:068b39ca76d82d028c73b7',
    messagingSenderId: '67582534550',
    projectId: 'kotlin-3cc89',
    authDomain: 'kotlin-3cc89.firebaseapp.com',
    storageBucket: 'kotlin-3cc89.appspot.com',
    measurementId: 'G-FJL3KHMCRT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwAKQtgcou6hnzWyCQNctdmZVW38ZB5zA',
    appId: '1:67582534550:android:a5d13b4030976ce88c73b7',
    messagingSenderId: '67582534550',
    projectId: 'kotlin-3cc89',
    storageBucket: 'kotlin-3cc89.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJD-ilyk_qhjoRNyx_lI1MV14LQkC-g9A',
    appId: '1:67582534550:ios:2e7f0fcb37d84b4c8c73b7',
    messagingSenderId: '67582534550',
    projectId: 'kotlin-3cc89',
    storageBucket: 'kotlin-3cc89.appspot.com',
    iosBundleId: 'com.example.kotlin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJD-ilyk_qhjoRNyx_lI1MV14LQkC-g9A',
    appId: '1:67582534550:ios:e22a4012ab599c538c73b7',
    messagingSenderId: '67582534550',
    projectId: 'kotlin-3cc89',
    storageBucket: 'kotlin-3cc89.appspot.com',
    iosBundleId: 'com.example.kotlin.RunnerTests',
  );
}
