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
    apiKey: 'AIzaSyAB8jg0xAxrLQZYrjC3N5HanVbF2fhnKnA',
    appId: '1:305804827696:web:e3f229ad466b90538161f5',
    messagingSenderId: '305804827696',
    projectId: 'finalproject-e1916',
    authDomain: 'finalproject-e1916.firebaseapp.com',
    storageBucket: 'finalproject-e1916.appspot.com',
    measurementId: 'G-H0H7887W7H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWY3SbSfi8meV2ze8SgAX3W7WSzqxH9Yw',
    appId: '1:305804827696:android:58b4027335c2d09e8161f5',
    messagingSenderId: '305804827696',
    projectId: 'finalproject-e1916',
    storageBucket: 'finalproject-e1916.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzFZHHgtEiFDjFUO0IFpsGZhGOeIzXQOA',
    appId: '1:305804827696:ios:99abd9ed64957ac78161f5',
    messagingSenderId: '305804827696',
    projectId: 'finalproject-e1916',
    storageBucket: 'finalproject-e1916.appspot.com',
    iosBundleId: 'com.example.derot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzFZHHgtEiFDjFUO0IFpsGZhGOeIzXQOA',
    appId: '1:305804827696:ios:0199b24b35e8d4ad8161f5',
    messagingSenderId: '305804827696',
    projectId: 'finalproject-e1916',
    storageBucket: 'finalproject-e1916.appspot.com',
    iosBundleId: 'com.example.derot.RunnerTests',
  );
}