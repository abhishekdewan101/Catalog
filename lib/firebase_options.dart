// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCBg4pIGV9DXznj4Mkx_9ZF9WUSIqVlIGY',
    appId: '1:775039500583:web:7b88f01a4ec3ec616aa902',
    messagingSenderId: '775039500583',
    projectId: 'mind-palace-dev',
    authDomain: 'mind-palace-dev.firebaseapp.com',
    storageBucket: 'mind-palace-dev.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeufytdm0M8TBIwMA-oR9TXkv2M1xvxCQ',
    appId: '1:775039500583:android:e309aa23719232cc6aa902',
    messagingSenderId: '775039500583',
    projectId: 'mind-palace-dev',
    storageBucket: 'mind-palace-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGJINEFz7Rv7Vogm7Gmpsty_e7CzMuQbo',
    appId: '1:775039500583:ios:edb2c1f587835a766aa902',
    messagingSenderId: '775039500583',
    projectId: 'mind-palace-dev',
    storageBucket: 'mind-palace-dev.appspot.com',
    iosClientId: '775039500583-3vgodi14huq8fn16m119q3et7n5qgs7n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mindPalace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGJINEFz7Rv7Vogm7Gmpsty_e7CzMuQbo',
    appId: '1:775039500583:ios:edb2c1f587835a766aa902',
    messagingSenderId: '775039500583',
    projectId: 'mind-palace-dev',
    storageBucket: 'mind-palace-dev.appspot.com',
    iosClientId: '775039500583-3vgodi14huq8fn16m119q3et7n5qgs7n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mindPalace',
  );
}